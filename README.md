# digital-system-lab-glitch

本实验用于课程教学，目标有两个：

1. 理解组合逻辑输出在真实硬件中可能出现毛刺（glitch）
2. 学会使用 Git / GitHub 完成一次最基本的工程提交流程

---

## 实验背景

`encoder8.v` 是一个 8-to-3 priority encoder（优先编码器），采用纯组合逻辑实现。

在仿真里它通常工作正常，但在真实硬件中，组合逻辑不同路径的传播延迟可能不同，因此输入变化时，输出可能在极短时间内出现不稳定跳变（glitch）。

工程上常见的改进方法是：

- 组合逻辑负责计算
- 寄存器在时钟边沿采样结果
- 对外输出使用寄存器值，从而获得稳定输出

---

## 目录说明

```text
digital-system-lab-glitch/
├── encoder8.v        # 原始组合逻辑版本
├── encoder8_sync.v   # 学生需要完成的同步修复版本
├── testbench.v       # 仿真测试文件
└── README.md         # 实验说明
