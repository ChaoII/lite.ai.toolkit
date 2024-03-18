CMAKE_MINIMUM_REQUIRED(VERSION 3.8)

set(ENABLE_ONNXRUNTIME ON)
set(ENABLE_MNN OFF)
set(ENABLE_NCNN OFF)
set(ENABLE_TNN OFF)

set(LITE_AI_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(THIRD_PARTY_PATH ${CMAKE_CURRENT_SOURCE_DIR}/include/third_party)
set(LITE_AI_LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib)

set(TOOLKIT_LIBS lite.ai.toolkit onnxruntime)
if ((UNIX AND NOT APPLE))
  set(OpenCV_LIBS opencv_core opencv_imgcodecs opencv_imgproc opencv_video opencv_videoio)
else()
  message(FATAL_ERROR "lite.ai.toolkit>=0.2 not support for windows/mac now!")
endif()

set(Lite_AI_INCLUDE_DIRS ${LITE_AI_INCLUDE_DIR})
set(Lite_AI_LIBS ${TOOLKIT_LIBS} ${OpenCV_LIBS})

include_directories(${LITE_AI_INCLUDE_DIR})
include_directories(${THIRD_PARTY_PATH}/opencv/include/opencv4)
include_directories(${THIRD_PARTY_PATH}/onnxruntime/include)

link_directories(${LITE_AI_LIB_DIR})
link_directories(${THIRD_PARTY_PATH}/opencv/lib)
link_directories(${THIRD_PARTY_PATH}/onnxruntime/lib)

if (ENABLE_MNN)
  list(APPEND Lite_AI_LIBS MNN)
  include_directories(${THIRD_PARTY_PATH}/MNN/include)
  link_directories(${THIRD_PARTY_PATH}/MNN/lib)
endif()

if (ENABLE_TNN)
  list(APPEND Lite_AI_LIBS TNN)
  include_directories(${THIRD_PARTY_PATH}/TNN/include)
  link_directories(${THIRD_PARTY_PATH}/TNN/lib)
endif()

if (ENABLE_NCNN)
  list(APPEND Lite_AI_LIBS ncnn)
  include_directories(${THIRD_PARTY_PATH}/ncnn/include)
  link_directories(${THIRD_PARTY_PATH}/ncnn/lib)
endif()














