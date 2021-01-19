//===-- P2AsmBackend.cpp - P2 Assembler Backend ---------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "P2AsmBackend.h"
#include "MCTargetDesc/P2MCTargetDesc.h"
#include "llvm/MC/MCAsmLayout.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCFixupKindInfo.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/Support/Debug.h"

#define DEBUG_TYPE "P2-asmbackend"

using namespace llvm;

std::unique_ptr<MCObjectTargetWriter>
P2AsmBackend::createObjectTargetWriter() const {
  return createP2ELFObjectWriter();
}

unsigned int P2AsmBackend::getNumFixupKinds() const { return 1; }

void P2AsmBackend::applyFixup(const MCAssembler &Asm, const MCFixup &Fixup,
                                const MCValue &Target,
                                MutableArrayRef<char> Data, uint64_t Value,
                                bool IsResolved,
                                const MCSubtargetInfo *STI) const {
  return;
}

bool P2AsmBackend::fixupNeedsRelaxation(const MCFixup &Fixup, uint64_t Value,
                                          const MCRelaxableFragment *DF,
                                          const MCAsmLayout &Layout) const {
  return false;
}

void P2AsmBackend::relaxInstruction(MCInst &Inst,
                                      const MCSubtargetInfo &STI) const {
  llvm_unreachable("P2AsmBackend::relaxInstruction() unimplemented");
}

bool P2AsmBackend::writeNopData(raw_ostream &OS, uint64_t Count) const {
  OS.write("\x00\x00\x00\x00", 4);
  return true;
}

MCAsmBackend *llvm::createP2AsmBackend(const Target &T,
                                         const MCSubtargetInfo &STI,
                                         const MCRegisterInfo &MRI,
                                         const MCTargetOptions &Options) {
  return new P2AsmBackend(STI, Options);
}
