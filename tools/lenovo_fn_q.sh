#!/bin/bash


ACPI_BALANCE="\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x000FB001"
ACPI_POWER="\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x0012B001"
ACPI_ECO="\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x0013B001"
ACPI_MODE="\_SB.PCI0.LPC0.EC0.SPMO"

MODE=$(sudo sh -c "echo '$ACPI_MODE' > /proc/acpi/call; tr -d '\0' < /proc/acpi/call")
MODE=${MODE:2}
TARGET=$(((MODE+1)%3))

case $TARGET in
    0)
        sudo sh -c "echo '$ACPI_BALANCE'> /proc/acpi/call; cat /proc/acpi/call; printf '\n'"
        notify-send "性能模式" "已切换至 平衡模式"
        ;;
    1)
        sudo sh -c "echo '$ACPI_POWER' > /proc/acpi/call; cat /proc/acpi/call; printf '\n'"
        notify-send "性能模式" "已切换至 性能模式"
        ;;
    2)
        sudo sh -c "echo '$ACPI_ECO' > /proc/acpi/call; cat /proc/acpi/call; printf '\n'"
        notify-send "性能模式" "已切换至 节能模式"
        ;;
esac

