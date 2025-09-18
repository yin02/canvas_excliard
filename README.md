# Canvas Excliard

基于 Excalidraw 的协作绘图平台

## 快速开始

### 启动服务

```bash
docker-compose up -d
```

### 访问地址

- **协作绘图**: http://localhost:9000
- **存储服务**: http://localhost:9001
- **房间服务**: http://localhost:9002

## 功能特性

- 🎨 实时协作绘图
- 🔄 自动保存
- 👥 多用户同时编辑
- 📱 响应式设计
- 🚀 开箱即用

## 管理命令

```bash
# 启动服务
docker-compose up -d

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down

# 重启服务
docker-compose restart
```

## 技术栈

- **前端**: Excalidraw (React + TypeScript)
- **后端**: Node.js + Express
- **存储**: SQLite
- **协作**: WebSocket
- **容器化**: Docker + Docker Compose

## 使用说明

1. 启动服务后访问 http://localhost:9000
2. 创建新房间或加入现有房间
3. 开始协作绘图！

## 许可证

MIT License