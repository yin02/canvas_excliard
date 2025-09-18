# Railway 部署指南

## 部署步骤

### 1. 准备 Railway 账户
- 访问 [Railway](https://railway.app)
- 使用 GitHub 账户登录
- 连接您的 GitHub 仓库

### 2. 创建项目
- 点击 "New Project"
- 选择 "Deploy from GitHub repo"
- 选择 `canvas_excliard` 仓库

### 3. 配置环境变量
在 Railway 项目设置中添加以下环境变量：

```
VITE_APP_BACKEND_V2_GET_URL=https://your-storage-service.railway.app/api/v2/scenes/
VITE_APP_BACKEND_V2_POST_URL=https://your-storage-service.railway.app/api/v2/scenes/
VITE_APP_WS_SERVER_URL=https://your-room-service.railway.app
VITE_APP_FIREBASE_CONFIG={}
VITE_APP_HTTP_STORAGE_BACKEND_URL=https://your-storage-service.railway.app/api/v2
VITE_APP_STORAGE_BACKEND=http
```

### 4. 部署后端服务

#### 存储服务
创建新服务，使用以下配置：
- **Dockerfile**: 
```dockerfile
FROM alswl/excalidraw-storage-backend:v2023.11.11
ENV PORT=8081
EXPOSE 8081
CMD ["npm", "run", "start:prod"]
```

#### 房间服务
创建新服务，使用以下配置：
- **Dockerfile**:
```dockerfile
FROM excalidraw/excalidraw-room:sha-49bf529
EXPOSE 80
CMD ["node", "dist/index.js"]
```

### 5. 更新环境变量
部署完后端服务后，更新前端服务的环境变量，使用实际的 Railway 域名。

## 注意事项

1. **端口配置**: Railway 会自动分配端口，不需要手动指定
2. **域名**: Railway 会为每个服务分配唯一的域名
3. **HTTPS**: Railway 自动提供 HTTPS 支持
4. **环境变量**: 确保所有服务间的通信使用 HTTPS

## 本地开发

```bash
# 启动本地开发环境
docker-compose up -d

# 访问应用
open http://localhost:9000
```

## 故障排除

1. **CORS 问题**: 确保所有服务使用 HTTPS
2. **连接超时**: 检查环境变量中的 URL 是否正确
3. **服务不可用**: 检查 Railway 服务状态和日志
