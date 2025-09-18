# 使用 Excalidraw 官方镜像作为基础
FROM alswl/excalidraw:v0.18.0-fork-b2

# 设置环境变量 - 独立模式，使用本地存储
ENV VITE_APP_BACKEND_V2_GET_URL=
ENV VITE_APP_BACKEND_V2_POST_URL=
ENV VITE_APP_WS_SERVER_URL=
ENV VITE_APP_FIREBASE_CONFIG={}
ENV VITE_APP_HTTP_STORAGE_BACKEND_URL=
ENV VITE_APP_STORAGE_BACKEND=local

# 暴露端口
EXPOSE 80

# 启动命令
CMD ["nginx", "-g", "daemon off;"]
