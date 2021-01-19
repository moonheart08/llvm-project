add_llvm_component_group(P2)

set(LLVM_TARGET_DEFINITIONS P2.td)

tablegen(LLVM P2GenRegisterInfo.inc -gen-register-info)
tablegen(LLVM P2GenInstrInfo.inc -gen-instr-info)
tablegen(LLVM P2GenMCCodeEmitter.inc -gen-emitter)

add_public_tablegen_target(P2CommonTableGen)

add_llvm_target(P2CodeGen
  P2TargetMachine.cpp

  LINK_COMPONENTS
  Core
  CodeGen
  P2Info
  Support
  Target

  ADD_TO_COMPONENT
  P2
  )

add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)
