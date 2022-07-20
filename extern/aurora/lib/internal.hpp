#pragma once

#include <string>
#include <string_view>

using namespace std::string_view_literals;

#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
#ifndef SBIG
#define SBIG(q) (((q)&0x000000FF) << 24 | ((q)&0x0000FF00) << 8 | ((q)&0x00FF0000) >> 8 | ((q)&0xFF000000) >> 24)
#endif
#else
#ifndef SBIG
#define SBIG(q) (q)
#endif
#endif

namespace aurora {
extern std::string g_configPath;
}
