// RUN: mlir-opt %s | mlir-opt | FileCheck %s
// RUN: mlir-opt %s --mlir-print-op-generic | mlir-opt | FileCheck %s


// CHECK-LABEL: func @ops(
// CHECK-SAME:            [[F:%.*]]: f32) {
func @ops(%f: f32) {
  // CHECK: [[C:%.*]] = complex.create [[F]], [[F]] : complex<f32>
  %complex = complex.create %f, %f : complex<f32>

  // CHECK: complex.re [[C]] : complex<f32>
  %real = complex.re %complex : complex<f32>

  // CHECK: complex.im [[C]] : complex<f32>
  %imag = complex.im %complex : complex<f32>

  // CHECK: complex.add [[C]], [[C]] : complex<f32>
  %sum = complex.add %complex, %complex : complex<f32>

  // CHECK: complex.sub [[C]], [[C]] : complex<f32>
  %diff = complex.sub %complex, %complex : complex<f32>
  return
}

