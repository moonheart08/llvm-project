//===-- P2TargetInfo.cpp - P2 Target Implementation -----------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "TargetInfo/P2TargetInfo.h"
#include "llvm/Support/TargetRegistry.h"
using namespace llvm;

Target &llvm::getTheP2Target() {
  static Target TheP2Target;
  return TheP2Target;
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeP2TargetInfo() {
  RegisterTarget<Triple::P2> X(getTheP2Target(), "P2", "Propeller 2", "P2");
}
