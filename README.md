# Performance Analysis of Pipelined RISC-V Architectures
### Instruction Flow and Hazard Observation
**COA Micro Project**

---

## 📌 About This Project
This project investigates how instructions flow through a **5-stage RISC-V pipeline** and how **data hazards** emerge when forwarding and hazard detection mechanisms are absent.

The simulation is run in **Ripes** a visual RISC-V pipeline simulator using a configuration with **no forwarding and no hazard detection**.

---

## 🔬 What We Observed
- Without hazard handling, the pipeline reads **stale register values**
- This causes **incorrect branching** (branch goes to `wrong` label)
- An invalid `ecall 999` is triggered instead of the correct `ecall 10` (exit)
- This demonstrates why **forwarding and hazard detection are essential** in real CPUs

---

## 🛠️ How to Run
1. Go to [Ripes Simulator](https://ripes.me/) in your browser
2. Click **Editor** tab and paste the code from `pipeline_test.s`
3. Go to **Settings** → set processor to **5-stage** with **no forwarding, no hazard detection**
4. Click **Run** and observe the pipeline diagram

---

## 📊 Results
> Screenshots of pipeline stages, hazard indicators, and register outputs are in the `/results` folder.

---

## 📚 References
- Patterson, D. A., & Hennessy, J. L. — *Computer Organization and Design: RISC-V Edition*
- Ripes RISC-V Simulator — https://ripes.me/
- RISC-V International — https://riscv.org/
