# Railway 部署完整指南

## 问题解决

您遇到的问题是只部署了前端服务，但 Excalidraw 需要完整的后端支持才能正常工作。

## 解决方案 1: 独立版本（推荐）

### 步骤 1: 更新 Dockerfile
将您的 Dockerfile 替换为 `Dockerfile.standalone`：

```bash
cp Dockerfile.standalone Dockerfile
```

### 步骤 2: 重新部署
在 Railway 中触发重新部署，这样 Excalidraw 将使用本地存储模式。

## 解决方案 2: 完整三服务部署

### 步骤 1: 创建存储服务
1. 在 Railway 项目中，点击 "New Service"
2. 选择 "Deploy from GitHub repo"
3. 选择同一个仓库
4. 在 "Settings" 中设置：
   - **Dockerfile Path**: `Dockerfile.storage`
   - **Service Name**: `canvas-excliard-storage`

### 步骤 2: 创建房间服务
1. 再次点击 "New Service"
2. 选择 "Deploy from GitHub repo"
3. 选择同一个仓库
4. 在 "Settings" 中设置：
   - **Dockerfile Path**: `Dockerfile.room`
   - **Service Name**: `canvas-excliard-room`

### 步骤 3: 更新前端服务环境变量
在前端服务的 "Variables" 中添加：

```
STORAGE_URL=https://canvas-excliard-storage-production.up.railway.app
ROOM_URL=https://canvas-excliard-room-production.up.railway.app
```

## 快速修复（推荐）

### 方法 1: 使用独立版本
1. 在 Railway 项目设置中，将 Dockerfile 路径改为 `Dockerfile.standalone`
2. 重新部署

### 方法 2: 修改现有 Dockerfile
将现有 Dockerfile 内容替换为：

```dockerfile
FROM alswl/excalidraw:v0.18.0-fork-b2

ENV VITE_APP_BACKEND_V2_GET_URL=
ENV VITE_APP_BACKEND_V2_POST_URL=
ENV VITE_APP_WS_SERVER_URL=
ENV VITE_APP_FIREBASE_CONFIG={}
ENV VITE_APP_HTTP_STORAGE_BACKEND_URL=
ENV VITE_APP_STORAGE_BACKEND=local

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

## 验证部署

部署成功后，您应该能够：
1. 访问 Railway 提供的 URL
2. 看到 Excalidraw 界面
3. 创建和编辑绘图
4. 保存和加载文件

## 注意事项

- 独立版本使用浏览器本地存储，数据不会持久化
- 如果需要协作功能，必须使用完整的三服务部署
- 确保所有服务都使用 HTTPS
