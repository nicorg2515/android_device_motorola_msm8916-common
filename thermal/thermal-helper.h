#ifndef __THERMAL_HELPER_H__
#define __THERMAL_HELPER_H__

#include <android/hardware/thermal/1.1/IThermal.h>
#include <hardware/thermal.h>

namespace android {
namespace hardware {
namespace thermal {
namespace V1_1 {
namespace implementation {

using ::android::hardware::thermal::V1_0::CpuUsage;
using ::android::hardware::thermal::V1_0::Temperature;

constexpr const char *kCpuUsageFile = "/proc/stat";
constexpr const char *kCpuOnlineFileFormat = "/sys/devices/system/cpu/cpu%d/online";
constexpr const char *kTemperatureFileFormat = "/sys/class/thermal/thermal_zone%d/temp";

// thermal-engine.conf
constexpr unsigned int kBatterySensorNum = 12;
constexpr unsigned int kTsensOffset = 1;
constexpr unsigned int kGpuTsensOffset = 3;

constexpr unsigned int kCpuNum = 8;

constexpr const char *kBatteryLabel = "battery";
constexpr const char *kCpuLabel[kCpuNum] = {"CPU0", "CPU1", "CPU2", "CPU3", "CPU4", "CPU5", "CPU6", "CPU7"};
constexpr int kCpuTsensOffset[kCpuNum] = {5, 6, 7, 8, 9, 9, 9, 9};
constexpr const char *kGpuLabel = "GPU";

// Sum of kCpuNum + 3 for GPU, BATTERY, and SKIN.
constexpr unsigned int kTemperatureNum = 3 + kCpuNum;

constexpr unsigned int kBatteryShutdownThreshold = 60;
constexpr unsigned int kCpuShutdownThreshold = 115;
constexpr unsigned int kCpuThrottlingThreshold = 80;

ssize_t fillTemperatures(hidl_vec<Temperature> *temperatures);
ssize_t fillCpuUsages(hidl_vec<CpuUsage> *cpuUsages);

}  // namespace implementation
}  // namespace V1_1
}  // namespace thermal
}  // namespace hardware
}  // namespace android

#endif //__THERMAL_HELPER_H__
