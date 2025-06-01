#pragma once

#define Handle1Op(func)                                                                                                                                        \
    do {                                                                                                                                                       \
        const auto op = GetOps(1)[0];                                                                                                                          \
        func(p.PerformShift(rinst, p.GetRegisterView(rinst, op), shift_type, shift));                                                                          \
    } while (0)
#define Handle2Ops(func)                                                                                                                                       \
    do {                                                                                                                                                       \
        const auto ops = GetOps(2);                                                                                                                            \
        p.StoreRegister(rinst, ops[0], rinst.builder->func(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1]), shift_type, shift)));                       \
    } while (0)
#define Handle3Ops(func)                                                                                                                                       \
    do {                                                                                                                                                       \
        const auto ops = GetOps(3);                                                                                                                            \
        p.StoreRegister(rinst, ops[0],                                                                                                                         \
                        rinst.builder->func(p.GetRegisterView(rinst, ops[1]),                                                                                  \
                                            p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2], rinst.GetRegType(ops[1])), shift_type, shift)));            \
    } while (0)
#define Handle3OpsNot(func)                                                                                                                                    \
    do {                                                                                                                                                       \
        const auto ops = GetOps(3);                                                                                                                            \
        p.StoreRegister(rinst, ops[0],                                                                                                                         \
                        rinst.builder->func(                                                                                                                   \
                            p.GetRegisterView(rinst, ops[1]),                                                                                                  \
                            rinst.builder->CreateNot(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2], rinst.GetRegType(ops[1])), shift_type, shift))));  \
    } while (0)

#define HandleShift(type)                                                                                                                                      \
    do {                                                                                                                                                       \
        const auto ops = GetOps(3);                                                                                                                            \
        if (ops[1] != ops[2]) {                                                                                                                                \
            p.StoreRegister(rinst, ops[0], p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1]), type, p.GetRegisterView(rinst, ops[2])));                   \
        } else {                                                                                                                                               \
            DYNAUTIC_ASSERT(shift_type == type);                                                                                                               \
            p.StoreRegister(rinst, ops[0], p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1]), type, shift));                                              \
        }                                                                                                                                                      \
    } while (0)
