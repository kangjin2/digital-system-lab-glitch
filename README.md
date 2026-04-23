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
```
## 你的任务
你需要完成 encoder8_sync.v：

- 调用原始模块 encoder8
- 获得组合输出 out_comb
- 在 posedge clk 时将其采样到寄存器 out_reg
- 最终输出 out_sync
  
## 建议步骤
1. Fork 仓库
把本仓库 Fork 到你自己的 GitHub 账号下。

2. 克隆到本地
```text   
git clone <your-fork-url>
cd digital-system-lab-glitch
```
3. 阅读代码
重点阅读：
```text
encoder8.v
encoder8_sync.v
```
- 思考：
  原始设计为什么是组合逻辑？
  为什么组合逻辑可能出现毛刺？
  为什么增加寄存器可以稳定输出？
4. 完成 encoder8_sync.v
在文件中补全同步逻辑。

5. 运行仿真
如果你使用 Icarus Verilog：
```text
iverilog -o simv testbench.v encoder8.v encoder8_sync.v
vvp simv
```
如需波形：
```text
gtkwave
```
如果你使用 Vivado，也可以直接建立工程并加入这 3 个 Verilog 文件进行仿真。

6. 提交修改
```text
git add encoder8_sync.v
git commit -m "fix: add clocked register for encoder output"
git push
```
7. 在 GitHub 上查看 Diff
进入你的仓库页面：

Commits
点击最新一次 commit
进入 Files changed
观察红绿差异（diff）：

红色：删除/替换的内容
绿色：新增的内容
这是 GitHub 最重要的工程协作视图之一。

## 提交要求
你需要提交：

完成后的 encoder8_sync.v
至少 1 次有效 commit
commit message 规范清晰
推荐格式：

fix: add sync register
fix: complete encoder8_sync
feat: implement registered encoder output
## 思考题
encoder8.v 为什么可能出现毛刺？
encoder8_sync.v 为什么能让输出更稳定？
为什么工程实践中，Git commit 信息要写清楚？
为什么 “看 diff” 比 “直接看最终代码” 更能反映工程过程？
