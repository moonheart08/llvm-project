; RUN: llc -mtriple=riscv64 -mattr=+experimental-v,+d,+experimental-zfh -verify-machineinstrs \
; RUN:   --riscv-no-aliases < %s | FileCheck %s
declare <vscale x 1 x float> @llvm.riscv.vfwsub.nxv1f32.nxv1f16.nxv1f16(
  <vscale x 1 x half>,
  <vscale x 1 x half>,
  i64);

define <vscale x 1 x float> @intrinsic_vfwsub_vv_nxv1f32_nxv1f16_nxv1f16(<vscale x 1 x half> %0, <vscale x 1 x half> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv1f32_nxv1f16_nxv1f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 1 x float> @llvm.riscv.vfwsub.nxv1f32.nxv1f16.nxv1f16(
    <vscale x 1 x half> %0,
    <vscale x 1 x half> %1,
    i64 %2)

  ret <vscale x 1 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwsub.mask.nxv1f32.nxv1f16.nxv1f16(
  <vscale x 1 x float>,
  <vscale x 1 x half>,
  <vscale x 1 x half>,
  <vscale x 1 x i1>,
  i64);

define <vscale x 1 x float> @intrinsic_vfwsub_mask_vv_nxv1f32_nxv1f16_nxv1f16(<vscale x 1 x float> %0, <vscale x 1 x half> %1, <vscale x 1 x half> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv1f32_nxv1f16_nxv1f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 1 x float> @llvm.riscv.vfwsub.mask.nxv1f32.nxv1f16.nxv1f16(
    <vscale x 1 x float> %0,
    <vscale x 1 x half> %1,
    <vscale x 1 x half> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret <vscale x 1 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwsub.nxv2f32.nxv2f16.nxv2f16(
  <vscale x 2 x half>,
  <vscale x 2 x half>,
  i64);

define <vscale x 2 x float> @intrinsic_vfwsub_vv_nxv2f32_nxv2f16_nxv2f16(<vscale x 2 x half> %0, <vscale x 2 x half> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv2f32_nxv2f16_nxv2f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 2 x float> @llvm.riscv.vfwsub.nxv2f32.nxv2f16.nxv2f16(
    <vscale x 2 x half> %0,
    <vscale x 2 x half> %1,
    i64 %2)

  ret <vscale x 2 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwsub.mask.nxv2f32.nxv2f16.nxv2f16(
  <vscale x 2 x float>,
  <vscale x 2 x half>,
  <vscale x 2 x half>,
  <vscale x 2 x i1>,
  i64);

define <vscale x 2 x float> @intrinsic_vfwsub_mask_vv_nxv2f32_nxv2f16_nxv2f16(<vscale x 2 x float> %0, <vscale x 2 x half> %1, <vscale x 2 x half> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv2f32_nxv2f16_nxv2f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 2 x float> @llvm.riscv.vfwsub.mask.nxv2f32.nxv2f16.nxv2f16(
    <vscale x 2 x float> %0,
    <vscale x 2 x half> %1,
    <vscale x 2 x half> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret <vscale x 2 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwsub.nxv4f32.nxv4f16.nxv4f16(
  <vscale x 4 x half>,
  <vscale x 4 x half>,
  i64);

define <vscale x 4 x float> @intrinsic_vfwsub_vv_nxv4f32_nxv4f16_nxv4f16(<vscale x 4 x half> %0, <vscale x 4 x half> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv4f32_nxv4f16_nxv4f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 4 x float> @llvm.riscv.vfwsub.nxv4f32.nxv4f16.nxv4f16(
    <vscale x 4 x half> %0,
    <vscale x 4 x half> %1,
    i64 %2)

  ret <vscale x 4 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwsub.mask.nxv4f32.nxv4f16.nxv4f16(
  <vscale x 4 x float>,
  <vscale x 4 x half>,
  <vscale x 4 x half>,
  <vscale x 4 x i1>,
  i64);

define <vscale x 4 x float> @intrinsic_vfwsub_mask_vv_nxv4f32_nxv4f16_nxv4f16(<vscale x 4 x float> %0, <vscale x 4 x half> %1, <vscale x 4 x half> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv4f32_nxv4f16_nxv4f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 4 x float> @llvm.riscv.vfwsub.mask.nxv4f32.nxv4f16.nxv4f16(
    <vscale x 4 x float> %0,
    <vscale x 4 x half> %1,
    <vscale x 4 x half> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret <vscale x 4 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwsub.nxv8f32.nxv8f16.nxv8f16(
  <vscale x 8 x half>,
  <vscale x 8 x half>,
  i64);

define <vscale x 8 x float> @intrinsic_vfwsub_vv_nxv8f32_nxv8f16_nxv8f16(<vscale x 8 x half> %0, <vscale x 8 x half> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv8f32_nxv8f16_nxv8f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 8 x float> @llvm.riscv.vfwsub.nxv8f32.nxv8f16.nxv8f16(
    <vscale x 8 x half> %0,
    <vscale x 8 x half> %1,
    i64 %2)

  ret <vscale x 8 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwsub.mask.nxv8f32.nxv8f16.nxv8f16(
  <vscale x 8 x float>,
  <vscale x 8 x half>,
  <vscale x 8 x half>,
  <vscale x 8 x i1>,
  i64);

define <vscale x 8 x float> @intrinsic_vfwsub_mask_vv_nxv8f32_nxv8f16_nxv8f16(<vscale x 8 x float> %0, <vscale x 8 x half> %1, <vscale x 8 x half> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv8f32_nxv8f16_nxv8f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 8 x float> @llvm.riscv.vfwsub.mask.nxv8f32.nxv8f16.nxv8f16(
    <vscale x 8 x float> %0,
    <vscale x 8 x half> %1,
    <vscale x 8 x half> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret <vscale x 8 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwsub.nxv16f32.nxv16f16.nxv16f16(
  <vscale x 16 x half>,
  <vscale x 16 x half>,
  i64);

define <vscale x 16 x float> @intrinsic_vfwsub_vv_nxv16f32_nxv16f16_nxv16f16(<vscale x 16 x half> %0, <vscale x 16 x half> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv16f32_nxv16f16_nxv16f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 16 x float> @llvm.riscv.vfwsub.nxv16f32.nxv16f16.nxv16f16(
    <vscale x 16 x half> %0,
    <vscale x 16 x half> %1,
    i64 %2)

  ret <vscale x 16 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwsub.mask.nxv16f32.nxv16f16.nxv16f16(
  <vscale x 16 x float>,
  <vscale x 16 x half>,
  <vscale x 16 x half>,
  <vscale x 16 x i1>,
  i64);

define <vscale x 16 x float> @intrinsic_vfwsub_mask_vv_nxv16f32_nxv16f16_nxv16f16(<vscale x 16 x float> %0, <vscale x 16 x half> %1, <vscale x 16 x half> %2, <vscale x 16 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv16f32_nxv16f16_nxv16f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 16 x float> @llvm.riscv.vfwsub.mask.nxv16f32.nxv16f16.nxv16f16(
    <vscale x 16 x float> %0,
    <vscale x 16 x half> %1,
    <vscale x 16 x half> %2,
    <vscale x 16 x i1> %3,
    i64 %4)

  ret <vscale x 16 x float> %a
}

declare <vscale x 1 x double> @llvm.riscv.vfwsub.nxv1f64.nxv1f32.nxv1f32(
  <vscale x 1 x float>,
  <vscale x 1 x float>,
  i64);

define <vscale x 1 x double> @intrinsic_vfwsub_vv_nxv1f64_nxv1f32_nxv1f32(<vscale x 1 x float> %0, <vscale x 1 x float> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv1f64_nxv1f32_nxv1f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,mf2,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 1 x double> @llvm.riscv.vfwsub.nxv1f64.nxv1f32.nxv1f32(
    <vscale x 1 x float> %0,
    <vscale x 1 x float> %1,
    i64 %2)

  ret <vscale x 1 x double> %a
}

declare <vscale x 1 x double> @llvm.riscv.vfwsub.mask.nxv1f64.nxv1f32.nxv1f32(
  <vscale x 1 x double>,
  <vscale x 1 x float>,
  <vscale x 1 x float>,
  <vscale x 1 x i1>,
  i64);

define <vscale x 1 x double> @intrinsic_vfwsub_mask_vv_nxv1f64_nxv1f32_nxv1f32(<vscale x 1 x double> %0, <vscale x 1 x float> %1, <vscale x 1 x float> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv1f64_nxv1f32_nxv1f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,mf2,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 1 x double> @llvm.riscv.vfwsub.mask.nxv1f64.nxv1f32.nxv1f32(
    <vscale x 1 x double> %0,
    <vscale x 1 x float> %1,
    <vscale x 1 x float> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret <vscale x 1 x double> %a
}

declare <vscale x 2 x double> @llvm.riscv.vfwsub.nxv2f64.nxv2f32.nxv2f32(
  <vscale x 2 x float>,
  <vscale x 2 x float>,
  i64);

define <vscale x 2 x double> @intrinsic_vfwsub_vv_nxv2f64_nxv2f32_nxv2f32(<vscale x 2 x float> %0, <vscale x 2 x float> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv2f64_nxv2f32_nxv2f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m1,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 2 x double> @llvm.riscv.vfwsub.nxv2f64.nxv2f32.nxv2f32(
    <vscale x 2 x float> %0,
    <vscale x 2 x float> %1,
    i64 %2)

  ret <vscale x 2 x double> %a
}

declare <vscale x 2 x double> @llvm.riscv.vfwsub.mask.nxv2f64.nxv2f32.nxv2f32(
  <vscale x 2 x double>,
  <vscale x 2 x float>,
  <vscale x 2 x float>,
  <vscale x 2 x i1>,
  i64);

define <vscale x 2 x double> @intrinsic_vfwsub_mask_vv_nxv2f64_nxv2f32_nxv2f32(<vscale x 2 x double> %0, <vscale x 2 x float> %1, <vscale x 2 x float> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv2f64_nxv2f32_nxv2f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m1,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 2 x double> @llvm.riscv.vfwsub.mask.nxv2f64.nxv2f32.nxv2f32(
    <vscale x 2 x double> %0,
    <vscale x 2 x float> %1,
    <vscale x 2 x float> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret <vscale x 2 x double> %a
}

declare <vscale x 4 x double> @llvm.riscv.vfwsub.nxv4f64.nxv4f32.nxv4f32(
  <vscale x 4 x float>,
  <vscale x 4 x float>,
  i64);

define <vscale x 4 x double> @intrinsic_vfwsub_vv_nxv4f64_nxv4f32_nxv4f32(<vscale x 4 x float> %0, <vscale x 4 x float> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv4f64_nxv4f32_nxv4f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m2,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 4 x double> @llvm.riscv.vfwsub.nxv4f64.nxv4f32.nxv4f32(
    <vscale x 4 x float> %0,
    <vscale x 4 x float> %1,
    i64 %2)

  ret <vscale x 4 x double> %a
}

declare <vscale x 4 x double> @llvm.riscv.vfwsub.mask.nxv4f64.nxv4f32.nxv4f32(
  <vscale x 4 x double>,
  <vscale x 4 x float>,
  <vscale x 4 x float>,
  <vscale x 4 x i1>,
  i64);

define <vscale x 4 x double> @intrinsic_vfwsub_mask_vv_nxv4f64_nxv4f32_nxv4f32(<vscale x 4 x double> %0, <vscale x 4 x float> %1, <vscale x 4 x float> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv4f64_nxv4f32_nxv4f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m2,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 4 x double> @llvm.riscv.vfwsub.mask.nxv4f64.nxv4f32.nxv4f32(
    <vscale x 4 x double> %0,
    <vscale x 4 x float> %1,
    <vscale x 4 x float> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret <vscale x 4 x double> %a
}

declare <vscale x 8 x double> @llvm.riscv.vfwsub.nxv8f64.nxv8f32.nxv8f32(
  <vscale x 8 x float>,
  <vscale x 8 x float>,
  i64);

define <vscale x 8 x double> @intrinsic_vfwsub_vv_nxv8f64_nxv8f32_nxv8f32(<vscale x 8 x float> %0, <vscale x 8 x float> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vv_nxv8f64_nxv8f32_nxv8f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m4,ta,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 8 x double> @llvm.riscv.vfwsub.nxv8f64.nxv8f32.nxv8f32(
    <vscale x 8 x float> %0,
    <vscale x 8 x float> %1,
    i64 %2)

  ret <vscale x 8 x double> %a
}

declare <vscale x 8 x double> @llvm.riscv.vfwsub.mask.nxv8f64.nxv8f32.nxv8f32(
  <vscale x 8 x double>,
  <vscale x 8 x float>,
  <vscale x 8 x float>,
  <vscale x 8 x i1>,
  i64);

define <vscale x 8 x double> @intrinsic_vfwsub_mask_vv_nxv8f64_nxv8f32_nxv8f32(<vscale x 8 x double> %0, <vscale x 8 x float> %1, <vscale x 8 x float> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vv_nxv8f64_nxv8f32_nxv8f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m4,tu,mu
; CHECK:       vfwsub.vv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 8 x double> @llvm.riscv.vfwsub.mask.nxv8f64.nxv8f32.nxv8f32(
    <vscale x 8 x double> %0,
    <vscale x 8 x float> %1,
    <vscale x 8 x float> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret <vscale x 8 x double> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwsub.nxv1f32.nxv1f16.f16(
  <vscale x 1 x half>,
  half,
  i64);

define <vscale x 1 x float> @intrinsic_vfwsub_vf_nxv1f32_nxv1f16_f16(<vscale x 1 x half> %0, half %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv1f32_nxv1f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 1 x float> @llvm.riscv.vfwsub.nxv1f32.nxv1f16.f16(
    <vscale x 1 x half> %0,
    half %1,
    i64 %2)

  ret <vscale x 1 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwsub.mask.nxv1f32.nxv1f16.f16(
  <vscale x 1 x float>,
  <vscale x 1 x half>,
  half,
  <vscale x 1 x i1>,
  i64);

define <vscale x 1 x float> @intrinsic_vfwsub_mask_vf_nxv1f32_nxv1f16_f16(<vscale x 1 x float> %0, <vscale x 1 x half> %1, half %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv1f32_nxv1f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 1 x float> @llvm.riscv.vfwsub.mask.nxv1f32.nxv1f16.f16(
    <vscale x 1 x float> %0,
    <vscale x 1 x half> %1,
    half %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret <vscale x 1 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwsub.nxv2f32.nxv2f16.f16(
  <vscale x 2 x half>,
  half,
  i64);

define <vscale x 2 x float> @intrinsic_vfwsub_vf_nxv2f32_nxv2f16_f16(<vscale x 2 x half> %0, half %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv2f32_nxv2f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 2 x float> @llvm.riscv.vfwsub.nxv2f32.nxv2f16.f16(
    <vscale x 2 x half> %0,
    half %1,
    i64 %2)

  ret <vscale x 2 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwsub.mask.nxv2f32.nxv2f16.f16(
  <vscale x 2 x float>,
  <vscale x 2 x half>,
  half,
  <vscale x 2 x i1>,
  i64);

define <vscale x 2 x float> @intrinsic_vfwsub_mask_vf_nxv2f32_nxv2f16_f16(<vscale x 2 x float> %0, <vscale x 2 x half> %1, half %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv2f32_nxv2f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 2 x float> @llvm.riscv.vfwsub.mask.nxv2f32.nxv2f16.f16(
    <vscale x 2 x float> %0,
    <vscale x 2 x half> %1,
    half %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret <vscale x 2 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwsub.nxv4f32.nxv4f16.f16(
  <vscale x 4 x half>,
  half,
  i64);

define <vscale x 4 x float> @intrinsic_vfwsub_vf_nxv4f32_nxv4f16_f16(<vscale x 4 x half> %0, half %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv4f32_nxv4f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 4 x float> @llvm.riscv.vfwsub.nxv4f32.nxv4f16.f16(
    <vscale x 4 x half> %0,
    half %1,
    i64 %2)

  ret <vscale x 4 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwsub.mask.nxv4f32.nxv4f16.f16(
  <vscale x 4 x float>,
  <vscale x 4 x half>,
  half,
  <vscale x 4 x i1>,
  i64);

define <vscale x 4 x float> @intrinsic_vfwsub_mask_vf_nxv4f32_nxv4f16_f16(<vscale x 4 x float> %0, <vscale x 4 x half> %1, half %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv4f32_nxv4f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 4 x float> @llvm.riscv.vfwsub.mask.nxv4f32.nxv4f16.f16(
    <vscale x 4 x float> %0,
    <vscale x 4 x half> %1,
    half %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret <vscale x 4 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwsub.nxv8f32.nxv8f16.f16(
  <vscale x 8 x half>,
  half,
  i64);

define <vscale x 8 x float> @intrinsic_vfwsub_vf_nxv8f32_nxv8f16_f16(<vscale x 8 x half> %0, half %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv8f32_nxv8f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 8 x float> @llvm.riscv.vfwsub.nxv8f32.nxv8f16.f16(
    <vscale x 8 x half> %0,
    half %1,
    i64 %2)

  ret <vscale x 8 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwsub.mask.nxv8f32.nxv8f16.f16(
  <vscale x 8 x float>,
  <vscale x 8 x half>,
  half,
  <vscale x 8 x i1>,
  i64);

define <vscale x 8 x float> @intrinsic_vfwsub_mask_vf_nxv8f32_nxv8f16_f16(<vscale x 8 x float> %0, <vscale x 8 x half> %1, half %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv8f32_nxv8f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 8 x float> @llvm.riscv.vfwsub.mask.nxv8f32.nxv8f16.f16(
    <vscale x 8 x float> %0,
    <vscale x 8 x half> %1,
    half %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret <vscale x 8 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwsub.nxv16f32.nxv16f16.f16(
  <vscale x 16 x half>,
  half,
  i64);

define <vscale x 16 x float> @intrinsic_vfwsub_vf_nxv16f32_nxv16f16_f16(<vscale x 16 x half> %0, half %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv16f32_nxv16f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 16 x float> @llvm.riscv.vfwsub.nxv16f32.nxv16f16.f16(
    <vscale x 16 x half> %0,
    half %1,
    i64 %2)

  ret <vscale x 16 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwsub.mask.nxv16f32.nxv16f16.f16(
  <vscale x 16 x float>,
  <vscale x 16 x half>,
  half,
  <vscale x 16 x i1>,
  i64);

define <vscale x 16 x float> @intrinsic_vfwsub_mask_vf_nxv16f32_nxv16f16_f16(<vscale x 16 x float> %0, <vscale x 16 x half> %1, half %2, <vscale x 16 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv16f32_nxv16f16_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 16 x float> @llvm.riscv.vfwsub.mask.nxv16f32.nxv16f16.f16(
    <vscale x 16 x float> %0,
    <vscale x 16 x half> %1,
    half %2,
    <vscale x 16 x i1> %3,
    i64 %4)

  ret <vscale x 16 x float> %a
}

declare <vscale x 1 x double> @llvm.riscv.vfwsub.nxv1f64.nxv1f32.f32(
  <vscale x 1 x float>,
  float,
  i64);

define <vscale x 1 x double> @intrinsic_vfwsub_vf_nxv1f64_nxv1f32_f32(<vscale x 1 x float> %0, float %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv1f64_nxv1f32_f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,mf2,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 1 x double> @llvm.riscv.vfwsub.nxv1f64.nxv1f32.f32(
    <vscale x 1 x float> %0,
    float %1,
    i64 %2)

  ret <vscale x 1 x double> %a
}

declare <vscale x 1 x double> @llvm.riscv.vfwsub.mask.nxv1f64.nxv1f32.f32(
  <vscale x 1 x double>,
  <vscale x 1 x float>,
  float,
  <vscale x 1 x i1>,
  i64);

define <vscale x 1 x double> @intrinsic_vfwsub_mask_vf_nxv1f64_nxv1f32_f32(<vscale x 1 x double> %0, <vscale x 1 x float> %1, float %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv1f64_nxv1f32_f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,mf2,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 1 x double> @llvm.riscv.vfwsub.mask.nxv1f64.nxv1f32.f32(
    <vscale x 1 x double> %0,
    <vscale x 1 x float> %1,
    float %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret <vscale x 1 x double> %a
}

declare <vscale x 2 x double> @llvm.riscv.vfwsub.nxv2f64.nxv2f32.f32(
  <vscale x 2 x float>,
  float,
  i64);

define <vscale x 2 x double> @intrinsic_vfwsub_vf_nxv2f64_nxv2f32_f32(<vscale x 2 x float> %0, float %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv2f64_nxv2f32_f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m1,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 2 x double> @llvm.riscv.vfwsub.nxv2f64.nxv2f32.f32(
    <vscale x 2 x float> %0,
    float %1,
    i64 %2)

  ret <vscale x 2 x double> %a
}

declare <vscale x 2 x double> @llvm.riscv.vfwsub.mask.nxv2f64.nxv2f32.f32(
  <vscale x 2 x double>,
  <vscale x 2 x float>,
  float,
  <vscale x 2 x i1>,
  i64);

define <vscale x 2 x double> @intrinsic_vfwsub_mask_vf_nxv2f64_nxv2f32_f32(<vscale x 2 x double> %0, <vscale x 2 x float> %1, float %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv2f64_nxv2f32_f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m1,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 2 x double> @llvm.riscv.vfwsub.mask.nxv2f64.nxv2f32.f32(
    <vscale x 2 x double> %0,
    <vscale x 2 x float> %1,
    float %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret <vscale x 2 x double> %a
}

declare <vscale x 4 x double> @llvm.riscv.vfwsub.nxv4f64.nxv4f32.f32(
  <vscale x 4 x float>,
  float,
  i64);

define <vscale x 4 x double> @intrinsic_vfwsub_vf_nxv4f64_nxv4f32_f32(<vscale x 4 x float> %0, float %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv4f64_nxv4f32_f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m2,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 4 x double> @llvm.riscv.vfwsub.nxv4f64.nxv4f32.f32(
    <vscale x 4 x float> %0,
    float %1,
    i64 %2)

  ret <vscale x 4 x double> %a
}

declare <vscale x 4 x double> @llvm.riscv.vfwsub.mask.nxv4f64.nxv4f32.f32(
  <vscale x 4 x double>,
  <vscale x 4 x float>,
  float,
  <vscale x 4 x i1>,
  i64);

define <vscale x 4 x double> @intrinsic_vfwsub_mask_vf_nxv4f64_nxv4f32_f32(<vscale x 4 x double> %0, <vscale x 4 x float> %1, float %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv4f64_nxv4f32_f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m2,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 4 x double> @llvm.riscv.vfwsub.mask.nxv4f64.nxv4f32.f32(
    <vscale x 4 x double> %0,
    <vscale x 4 x float> %1,
    float %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret <vscale x 4 x double> %a
}

declare <vscale x 8 x double> @llvm.riscv.vfwsub.nxv8f64.nxv8f32.f32(
  <vscale x 8 x float>,
  float,
  i64);

define <vscale x 8 x double> @intrinsic_vfwsub_vf_nxv8f64_nxv8f32_f32(<vscale x 8 x float> %0, float %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_vf_nxv8f64_nxv8f32_f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m4,ta,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 8 x double> @llvm.riscv.vfwsub.nxv8f64.nxv8f32.f32(
    <vscale x 8 x float> %0,
    float %1,
    i64 %2)

  ret <vscale x 8 x double> %a
}

declare <vscale x 8 x double> @llvm.riscv.vfwsub.mask.nxv8f64.nxv8f32.f32(
  <vscale x 8 x double>,
  <vscale x 8 x float>,
  float,
  <vscale x 8 x i1>,
  i64);

define <vscale x 8 x double> @intrinsic_vfwsub_mask_vf_nxv8f64_nxv8f32_f32(<vscale x 8 x double> %0, <vscale x 8 x float> %1, float %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwsub_mask_vf_nxv8f64_nxv8f32_f32
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e32,m4,tu,mu
; CHECK:       vfwsub.vf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 8 x double> @llvm.riscv.vfwsub.mask.nxv8f64.nxv8f32.f32(
    <vscale x 8 x double> %0,
    <vscale x 8 x float> %1,
    float %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret <vscale x 8 x double> %a
}
