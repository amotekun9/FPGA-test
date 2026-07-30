# FPGA

## 架构说明
- `doc/`: 规格文档与寄存器定义
- `rtl/`: HDL 核心代码与外设驱动 (`.v` / `.sv` / `.vhd` / `.tdf`)
- `ip/`: IP 核配置文件 (`.qip` / `.qsys`)
- `constraint/`: 管脚配置与时序约束 (`.sdc` / `.tcl`)
- `tb/`: 测试平台与 ModelSim 仿真脚本 (`.do`)
- `prj/`: Quartus 工程存放目录 (双击 `.qpf` 运行)
- `release/`: 编译输出固件镜像

归纳总结
不要看后缀选文件夹，要看功能选文件夹：

负责控制芯片外设 / 板载硬件的 .v 或 .bdf → 放 rtl/driver/

负责算法与业务逻辑的 .v 或 .bdf → 放 rtl/core/

负责组装串联所有子模块的顶层文件 → 放 rtl/ 根目录