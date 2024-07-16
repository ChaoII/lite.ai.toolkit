//
// Created by wangzijian on 24-7-11.
//

#ifndef LITE_AI_TOOLKIT_TRT_HANDLER_H
#define LITE_AI_TOOLKIT_TRT_HANDLER_H
#include "trt_config.h"
#include "Logger.h"

namespace trtcore{
    class LITE_EXPORTS BasicTRTHandler{
    protected:
        nvinfer1::IRuntime* trt_runtime = nullptr;
        nvinfer1::ICudaEngine* trt_engine = nullptr;
        nvinfer1::IExecutionContext* trt_context = nullptr;

        Logger trt_logger;
        // single input and single output
        void* buffers[2];
        cudaStream_t stream;

        std::vector<int64_t> input_node_dims;
        std::vector<int64_t> output_node_dims;
        std::size_t input_tensor_size = 1;
        std::size_t output_tensor_size = 1;

        const char* trt_model_path = nullptr;
        const char* log_id = nullptr;
        const unsigned int num_threads;

    protected:
        explicit BasicTRTHandler(const std::string& _trt_model_path,unsigned int _num_threads = 1);

        virtual ~BasicTRTHandler();

    protected:
        BasicTRTHandler(const BasicTRTHandler&) = delete;
        BasicTRTHandler(BasicTRTHandler&&) = delete;
        BasicTRTHandler& operator=(const BasicTRTHandler&) = delete;
        BasicTRTHandler& operator=(BasicTRTHandler&&) = delete;

    protected:
        virtual float* transform(const cv::Mat &mat) = 0;

    private:
        void initialize_handler();

        void print_debug_string();
    };


}



#endif //LITE_AI_TOOLKIT_TRT_HANDLER_H
