//
//  TestExampleTests.swift
//  TestExampleTests
//
//  Created by Ana Lucia Blanco Cervantes on 07/09/22.
//

import XCTest
@testable import TestExample

// MARK: - Class
struct Producto {
    var precio: CGFloat
    var nombre: String
    init(precio: CGFloat, nombre: String) {
        self.precio = precio
        self.nombre = nombre
    }
    
    func aplicarDescuento(descuento: CGFloat) -> CGFloat{
        let multiplicador = 1 - descuento / 100
        return precio * multiplicador
    }
}

class CarritoDeCompras {
    private var productos = [Producto]()
    func agregar(producto: Producto) {
        productos.append(producto)
    }
    func total() -> CGFloat{
        productos.map({$0.precio}).reduce(0, +)
    }
}

class ServicioDeProductos {
    var productos = [Producto]()
    func obtenerProductos(completion: @escaping ([Producto]) ->
                          Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.productos = [
                Producto(precio: 50.0, nombre: "Luces"),
                Producto(precio: 100.0, nombre: "Pelota"),
                Producto(precio: 10.0, nombre: "Guirnaldas"),
                Producto(precio: 20.0, nombre: "Velas"),
                Producto(precio: 20.0, nombre: "Sombrilla"),
                Producto(precio: 20.0, nombre: "Velador")
            ]
            completion(self.productos)
        }
    }
}

// MARK: - Tests
class TestExampleTests: XCTestCase {

    override func setUpWithError() throws {
        
    }
    
    func test_aplicarDescuentoAProducto_retornaValorConDescuento() {
        let product = Producto(precio: 120, nombre: "Un producto")
        let precioConDescuento = product.aplicarDescuento(descuento: 50)
        
        XCTAssertEqual(precioConDescuento, 60)
    }
    
    func test_calcularPrecioTotalDelCarrito_retornaTotal() {
        let productos = [Producto(precio: 27, nombre: "Gansito"),
                         Producto(precio: 13, nombre: "Soda"),
                         Producto(precio: 20, nombre: "Otra cosa")]
        
        let carritoDeCompras = CarritoDeCompras()
        
        productos.forEach { producto in
            carritoDeCompras.agregar(producto: producto)
        }
        
        XCTAssertEqual(carritoDeCompras.total(), 60)
    }
    
    func test_obtenerProductos_retornaProductos() throws {
        let servicioDeProductos = ServicioDeProductos()
        let promesa = expectation(description: "Se obtuvieron los productos con exito!")
        
        servicioDeProductos.obtenerProductos { productos in
            servicioDeProductos.productos = productos
            promesa.fulfill()
        }
        
        wait(for: [promesa], timeout: 3)
        
        XCTAssertNotNil(servicioDeProductos.productos)
    }

    override func tearDownWithError() throws {
        
    }
}
