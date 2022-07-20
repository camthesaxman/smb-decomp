#pragma once

#include <fmt/format.h>

extern "C" {
void logwrapper_report(int severity, const char* message);
}

namespace logwrapper {
enum Level {
  Info,
  Warning,
  Error,
  Fatal,
};
struct Module {
  const char* name;
  Module(const char* name) : name(name) {}
  template <typename... T>
  void report(Level severity, fmt::format_string<T...> fmt, T&&... args) {
    logwrapper_report(severity, fmt::format(fmt, std::forward<T>(args)...).c_str());
    if (severity == Fatal) {
      abort();
    }
  }
};
} // namespace logwrapper
