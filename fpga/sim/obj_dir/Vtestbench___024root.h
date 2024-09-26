// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestbench.h for the primary calling header

#ifndef VERILATED_VTESTBENCH___024ROOT_H_
#define VERILATED_VTESTBENCH___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtestbench__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestbench___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ testbench__DOT__clk;
    CData/*6:0*/ testbench__DOT__segOutput;
    CData/*3:0*/ testbench__DOT__switches;
    CData/*2:0*/ testbench__DOT__leds;
    CData/*5:0*/ testbench__DOT__testCounter;
    CData/*5:0*/ testbench__DOT__errors;
    CData/*6:0*/ testbench__DOT__segExpected;
    CData/*1:0*/ testbench__DOT__ledsExpected;
    CData/*0:0*/ testbench__DOT__ledOut__DOT__ledStatus;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __Vtrigprevexpr___TOP__testbench__DOT__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*24:0*/ testbench__DOT__ledOut__DOT__counter;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<SData/*12:0*/, 51> testbench__DOT__testVectors;
    VlDelayScheduler __VdlySched;
    VlTriggerScheduler __VtrigSched_hf827bb3d__0;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<3> __VactTriggered;
    VlTriggerVec<3> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vtestbench__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestbench___024root(Vtestbench__Syms* symsp, const char* v__name);
    ~Vtestbench___024root();
    VL_UNCOPYABLE(Vtestbench___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
