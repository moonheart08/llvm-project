add_llvm_component_library(LLVMP2Desc
  P2AsmBackend.cpp
  P2ELFObjectWriter.cpp
  P2MCAsmInfo.cpp
  P2MCTargetDesc.cpp
  P2MCCodeEmitter.cpp

  LINK_COMPONENTS
  MC
  P2Info
  Support

  ADD_TO_COMPONENT
  P2
)
