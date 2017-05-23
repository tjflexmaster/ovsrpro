########################################
# novas 
########################################
xpProOption(zeromq)
set(VERSION 4.2.1)
set(ZEROMQ_SRC_PATH ${CMAKE_BINARY_DIR}/xpbase/Source/zeromq)
set(ZEROMQ_DLURL https://github.com/zeromq/libzmq/releases/download/v${VERSION}/zeromq-${VERSION}.tar.gz)
set(ZEROMQ_DLMD5 820cec2860a72c3257881a394d83bfc0)
set(PRO_ZEROMQ
  NAME zeromq
  WEB "ZEROMQ" https://zeromq.org "ZEROMQ"
  LICENSE "open" https://github.com/zeromq/libzmq/blob/master/README.md "(See License Section. GNU Lesser General Public LIcense.)"
  DESC "ZEROMQ is a lightweight messaging kernel is a library that extends standard socket interfaces."
  VER ${VERSION}
  DLURL ${ZEROMQ_DLURL}
  DLMD5 ${ZEROMQ_DLMD5}
  #PATCH ${PATCH_DIR}/zeromq.patch
)
########################################
#function(patch_zeromq)
#  if(NOT (XP_DEFAULT OR XP_PRO_ZEROMQ))
#    return()
#  endif()

#  xpPatch(${PRO_ZEROMQ})
#endfunction()
########################################
function(build_zeromq)
  if (NOT (XP_DEFAULT OR XP_PRO_ZEROMQ))
    return()
  endif()
  configure_file(${PRO_DIR}/use/useop-zeromq-config.cmake ${STAGE_DIR}/share/cmake/
    @ONLY NEWLINE_STYLE LF
  )

  xpSetPostfix()
  set(XP_CONFIGURE
    -DCMAKE_DEBUG_POSTFIX=${CMAKE_DEBUG_POSTFIX}
    )
  xpCmakeBuild(zeromq "" "${XP_CONFIGURE}")

endfunction()
