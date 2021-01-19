//===-- P2MCTargetDesc.cpp - P2 Target Descriptions -----------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// This file provides P2 specific target descriptions.
///
//===----------------------------------------------------------------------===//

#include "P2MCTargetDesc.h"
#include "P2AsmBackend.h"
#include "P2MCAsmInfo.h"
#include "P2MCCodeEmitter.h"
#include "TargetInfo/P2TargetInfo.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/TargetRegistry.h"

#define GET_INSTRINFO_MC_DESC
#include "P2GenInstrInfo.inc"

#define GET_REGINFO_MC_DESC
#include "P2GenRegisterInfo.inc"

using namespace llvm;

static MCAsmInfo *createP2MCAsmInfo(const MCRegisterInfo &MRI,
                                      const Triple &TT,
                                      const MCTargetOptions &Options) {
  MCAsmInfo *MAI = new P2MCAsmInfo(TT);

  // Initial state of the frame pointer is SP.
  unsigned Reg = MRI.getDwarfRegNum(P2::R504, true);
  MCCFIInstruction Inst = MCCFIInstruction::cfiDefCfa(nullptr, Reg, 0);
  MAI->addInitialFrameState(Inst);
  return MAI;
}

static MCInstrInfo *createP2MCInstrInfo() {
  MCInstrInfo *Info = new MCInstrInfo();
  InitP2MCInstrInfo(Info);
  return Info;
}

static MCRegisterInfo *createP2MCRegisterInfo(const Triple &TT) {
  MCRegisterInfo *Info = new MCRegisterInfo();
  InitP2MCRegisterInfo(Info, P2::R505);
  return Info;
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeP2TargetMC() {
  auto &P2Target = getTheP2Target();
  TargetRegistry::RegisterMCAsmBackend(P2Target, createP2AsmBackend);
  TargetRegistry::RegisterMCAsmInfo(P2Target, createP2MCAsmInfo);
  TargetRegistry::RegisterMCInstrInfo(P2Target, createP2MCInstrInfo);
  TargetRegistry::RegisterMCRegInfo(P2Target, createP2MCRegisterInfo);
  TargetRegistry::RegisterMCCodeEmitter(P2Target, createP2MCCodeEmitter);
}
