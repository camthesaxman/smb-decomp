#pragma once

#include <array>
#include <type_traits>
#include <vector>
#include <cstddef>
#include <cassert>
#include <string_view>
#include <string>
#include <cstdint>
#include <cstring>

#ifdef METAFORCE
#include "Runtime/RetroTypes.hpp"
#include <zeus/CColor.hpp>
#endif

using s8 = int8_t;
using u8 = uint8_t;
using s16 = int16_t;
using u16 = uint16_t;
using s32 = int32_t;
using u32 = uint32_t;
using s64 = int64_t;
using u64 = uint64_t;

#ifndef __has_attribute
#define __has_attribute(x) 0
#endif
#ifndef __has_builtin
#define __has_builtin(x) 0
#endif
#if __has_attribute(vector_size)
//#define USE_GCC_VECTOR_EXTENSIONS
#endif

namespace aurora {
template <typename T>
struct Vec2 {
  T x{};
  T y{};

  constexpr Vec2() = default;
  constexpr Vec2(T x, T y) : x(x), y(y) {}
#ifdef METAFORCE
  constexpr Vec2(const zeus::CVector2f& vec) : x(vec.x()), y(vec.y()) {}
#endif

  bool operator==(const Vec2& rhs) const { return x == rhs.x && y == rhs.y; }
};
template <typename T>
struct Vec3 {
  T x{};
  T y{};
  T z{};

  constexpr Vec3() = default;
  constexpr Vec3(T x, T y, T z) : x(x), y(y), z(z) {}
#ifdef METAFORCE
  constexpr Vec3(const zeus::CVector3f& vec) : x(vec.x()), y(vec.y()), z(vec.z()) {}
  operator zeus::CVector3f() const { return {x, y, z}; }
#endif

  bool operator==(const Vec3& rhs) const { return x == rhs.x && y == rhs.y && z == rhs.z; }
};
template <typename T>
struct Vec4 {
#ifdef USE_GCC_VECTOR_EXTENSIONS
  typedef T Vt __attribute__((vector_size(sizeof(T) * 4)));
  Vt m;
#else
  using Vt = T[4];
  Vt m;
#endif

  constexpr Vec4() = default;
  constexpr Vec4(Vt m) : m(m) {}
  constexpr Vec4(T x, T y, T z, T w) : m{x, y, z, w} {}
  // For Vec3 with padding
  constexpr Vec4(T x, T y, T z) : m{x, y, z, {}} {}
  // For Vec3 -> Vec4
  constexpr Vec4(Vec3<T> v, T w) : m{v.x, v.y, v.z, w} {}
#ifdef METAFORCE
  constexpr Vec4(const zeus::CVector4f& vec) : x(vec.x()), y(vec.y()), z(vec.z()), w(vec.w()) {}
  constexpr Vec4(const zeus::CColor& color) : x(color.r()), y(color.g()), z(color.b()), w(color.a()) {}
#endif

  inline Vec4& operator=(const Vec4& other) {
    memcpy(&m, &other.m, sizeof(Vt));
    return *this;
  }

  [[nodiscard]] inline T& x() { return m[0]; }
  [[nodiscard]] inline T x() const { return m[0]; }
  [[nodiscard]] inline T& y() { return m[1]; }
  [[nodiscard]] inline T y() const { return m[1]; }
  [[nodiscard]] inline T& z() { return m[2]; }
  [[nodiscard]] inline T z() const { return m[2]; }
  [[nodiscard]] inline T& w() { return m[3]; }
  [[nodiscard]] inline T w() const { return m[3]; }
  [[nodiscard]] inline T& operator[](size_t i) { return m[i]; }
  [[nodiscard]] inline T operator[](size_t i) const { return m[i]; }

  template <size_t x, size_t y, size_t z, size_t w>
  [[nodiscard]] constexpr Vec4 shuffle() const {
    static_assert(x < 4 && y < 4 && z < 4 && w < 4);
#if defined(USE_GCC_VECTOR_EXTENSIONS) && __has_builtin(__builtin_shuffle)
    typedef int Vi __attribute__((vector_size(16)));
    return __builtin_shuffle(m, Vi{x, y, z, w});
#else
    return {m[x], m[y], m[z], m[w]};
#endif
  }

  bool operator==(const Vec4& rhs) const {
#if defined(USE_GCC_VECTOR_EXTENSIONS) && __has_builtin(__builtin_reduce_and)
    return __builtin_reduce_and(m == rhs.m) != 0;
#else
    return m[0] == rhs.m[0] && m[1] == rhs.m[1] && m[2] == rhs.m[2] && m[3] == rhs.m[3];
#endif
  }
};
template <typename T>
[[nodiscard]] inline Vec4<T> operator+(const Vec4<T>& a, const Vec4<T>& b) {
#ifdef USE_GCC_VECTOR_EXTENSIONS
  return a.m + b.m;
#else
  return {a.m[0] + b.m[0], a.m[1] + b.m[1], a.m[2] + b.m[2], a.m[3] + b.m[3]};
#endif
}
template <typename T>
[[nodiscard]] inline Vec4<T> operator*(const Vec4<T>& a, const Vec4<T>& b) {
#ifdef USE_GCC_VECTOR_EXTENSIONS
  return a.m * b.m;
#else
  return {a.m[0] * b.m[0], a.m[1] * b.m[1], a.m[2] * b.m[2], a.m[3] * b.m[3]};
#endif
}
template <typename T>
struct Mat3x2 {
  Vec2<T> m0{};
  Vec2<T> m1{};
  Vec2<T> m2{};

  constexpr Mat3x2() = default;
  constexpr Mat3x2(const Vec2<T>& m0, const Vec2<T>& m1, const Vec2<T>& m2) : m0(m0), m1(m1), m2(m2) {}

  bool operator==(const Mat3x2& rhs) const { return m0 == rhs.m0 && m1 == rhs.m1 && m2 == rhs.m2; }
};
template <typename T>
struct Mat4x2 {
  Vec2<T> m0{};
  Vec2<T> m1{};
  Vec2<T> m2{};
  Vec2<T> m3{};

  constexpr Mat4x2() = default;
  constexpr Mat4x2(const Vec2<T>& m0, const Vec2<T>& m1, const Vec2<T>& m2, const Vec2<T>& m3)
  : m0(m0), m1(m1), m2(m2), m3(m3) {}

  inline Mat4x2 transpose() const {
    return {
        {m0.x, m2.x},
        {m0.y, m2.y},
        {m1.x, m3.x},
        {m1.y, m3.y},
    };
  }

  bool operator==(const Mat4x2& rhs) const { return m0 == rhs.m0 && m1 == rhs.m1 && m2 == rhs.m2 && m3 == rhs.m3; }
};
template <typename T>
struct Mat4x4;
template <typename T>
struct Mat3x4 {
  Vec4<T> m0{};
  Vec4<T> m1{};
  Vec4<T> m2{};

  constexpr Mat3x4() = default;
  constexpr Mat3x4(const Vec4<T>& m0, const Vec4<T>& m1, const Vec4<T>& m2)
  : m0(m0), m1(m1), m2(m2) {}

  inline Mat4x4<T> to4x4() const;
  inline Mat4x4<T> toTransposed4x4() const;
};
static_assert(sizeof(Mat3x4<float>) == sizeof(float[3][4]));
template <typename T>
struct Mat4x4 {
  Vec4<T> m0{};
  Vec4<T> m1{};
  Vec4<T> m2{};
  Vec4<T> m3{};

  constexpr Mat4x4() = default;
  constexpr Mat4x4(const Vec4<T>& m0, const Vec4<T>& m1, const Vec4<T>& m2, const Vec4<T>& m3)
  : m0(m0), m1(m1), m2(m2), m3(m3) {}
#ifdef METAFORCE
  constexpr Mat4x4(const zeus::CMatrix4f& m) : m0(m[0]), m1(m[1]), m2(m[2]), m3(m[3]) {}
  constexpr Mat4x4(const zeus::CTransform& m) : Mat4x4(m.toMatrix4f()) {}
#endif

  [[nodiscard]] Mat4x4 transpose() const {
    return {
        {m0[0], m1[0], m2[0], m3[0]},
        {m0[1], m1[1], m2[1], m3[1]},
        {m0[2], m1[2], m2[2], m3[2]},
        {m0[3], m1[3], m2[3], m3[3]},
    };
  }
  inline Mat4x4& operator=(const Mat4x4& other) {
    m0 = other.m0;
    m1 = other.m1;
    m2 = other.m2;
    m3 = other.m3;
    return *this;
  }

  inline Vec4<T>& operator[](size_t i) { return *(&m0 + i); }
  inline const Vec4<T>& operator[](size_t i) const { return *(&m0 + i); }

  bool operator==(const Mat4x4& rhs) const { return m0 == rhs.m0 && m1 == rhs.m1 && m2 == rhs.m2 && m3 == rhs.m3; }
};
static_assert(sizeof(Mat4x4<float>) == sizeof(float[4][4]));
template <typename T>
[[nodiscard]] inline Mat4x4<T> operator*(const Mat4x4<T>& a, const Mat4x4<T>& b) {
  Mat4x4<T> out;
  for (size_t i = 0; i < 4; ++i) {
    *(&out.m0 + i) = a.m0 * b[i].template shuffle<0, 0, 0, 0>() + a.m1 * b[i].template shuffle<1, 1, 1, 1>() +
                     a.m2 * b[i].template shuffle<2, 2, 2, 2>() + a.m3 * b[i].template shuffle<3, 3, 3, 3>();
  }
  return out;
}
template <typename T>
[[nodiscard]] inline Mat4x4<T> Mat3x4<T>::to4x4() const {
  return {
      {m0.m[0], m0.m[1], m0.m[2], 0.f},
      {m1.m[0], m1.m[1], m1.m[2], 0.f},
      {m2.m[0], m2.m[1], m2.m[2], 0.f},
      {m0.m[3], m1.m[3], m2.m[3], 1.f},
  };
}
template <typename T>
[[nodiscard]] inline Mat4x4<T> Mat3x4<T>::toTransposed4x4() const {
  return Mat4x4<T>{
      m0,
      m1,
      m2,
      {0.f, 0.f, 0.f, 1.f},
  }.transpose();
}
constexpr Mat4x4<float> Mat4x4_Identity{
    Vec4<float>{1.f, 0.f, 0.f, 0.f},
    Vec4<float>{0.f, 1.f, 0.f, 0.f},
    Vec4<float>{0.f, 0.f, 1.f, 0.f},
    Vec4<float>{0.f, 0.f, 0.f, 1.f},
};

template <typename T>
class ArrayRef {
public:
  using value_type = std::remove_cvref_t<T>;
  using pointer = value_type*;
  using const_pointer = const value_type*;
  using reference = value_type&;
  using const_reference = const value_type&;
  using iterator = const_pointer;
  using const_iterator = const_pointer;
  using reverse_iterator = std::reverse_iterator<iterator>;
  using const_reverse_iterator = std::reverse_iterator<const_iterator>;
  using size_type = std::size_t;
  using difference_type = std::ptrdiff_t;

  ArrayRef() = default;
  explicit ArrayRef(const T& one) : ptr(&one), length(1) {}
  ArrayRef(const T* data, size_t length) : ptr(data), length(length) {}
  ArrayRef(const T* begin, const T* end) : ptr(begin), length(end - begin) {}
  template <size_t N>
  constexpr ArrayRef(const T (&arr)[N]) : ptr(arr), length(N) {}
  template <size_t N>
  constexpr ArrayRef(const std::array<T, N>& arr) : ptr(arr.data()), length(arr.size()) {}
  ArrayRef(const std::vector<T>& vec) : ptr(vec.data()), length(vec.size()) {}
#ifdef METAFORCE
  template <size_t N>
  ArrayRef(const rstl::reserved_vector<T, N>& vec) : ptr(vec.data()), length(vec.size()) {}
#endif

  const T* data() const { return ptr; }
  size_t size() const { return length; }
  bool empty() const { return length == 0; }

  const T& front() const {
    assert(!empty());
    return ptr[0];
  }
  const T& back() const {
    assert(!empty());
    return ptr[length - 1];
  }
  const T& operator[](size_t i) const {
    assert(i < length && "Invalid index!");
    return ptr[i];
  }

  iterator begin() const { return ptr; }
  iterator end() const { return ptr + length; }

  reverse_iterator rbegin() const { return reverse_iterator(end()); }
  reverse_iterator rend() const { return reverse_iterator(begin()); }

  /// Disallow accidental assignment from a temporary.
  template <typename U>
  std::enable_if_t<std::is_same<U, T>::value, ArrayRef<T>>& operator=(U&& Temporary) = delete;

  /// Disallow accidental assignment from a temporary.
  template <typename U>
  std::enable_if_t<std::is_same<U, T>::value, ArrayRef<T>>& operator=(std::initializer_list<U>) = delete;

private:
  const T* ptr = nullptr;
  size_t length = 0;
};

template <typename CharT, typename Traits = std::char_traits<CharT>>
class basic_zstring_view;

using zstring_view = basic_zstring_view<char>;
using wzstring_view = basic_zstring_view<wchar_t>;
using u16zstring_view = basic_zstring_view<char16_t>;
using u32zstring_view = basic_zstring_view<char32_t>;

template <typename CharT, typename Traits>
class basic_zstring_view {
public:
  using underlying_type = std::basic_string_view<CharT, Traits>;

  using traits_type = typename underlying_type::traits_type;
  using value_type = typename underlying_type::value_type;
  using pointer = typename underlying_type::pointer;
  using const_pointer = typename underlying_type::const_pointer;
  using reference = typename underlying_type::reference;
  using const_reference = typename underlying_type::const_reference;
  using const_iterator = typename underlying_type::const_iterator;
  using iterator = typename underlying_type::iterator;
  using const_reverse_iterator = typename underlying_type::const_reverse_iterator;
  using reverse_iterator = typename underlying_type::reverse_iterator;
  using size_type = typename underlying_type::size_type;
  using difference_type = typename underlying_type::difference_type;

  static constexpr size_type npos = -1;

  constexpr basic_zstring_view() noexcept = default;
  constexpr basic_zstring_view(const basic_zstring_view& other) noexcept = default;
  constexpr basic_zstring_view(const CharT* s) : m_view{s} {}
  constexpr basic_zstring_view(const std::string& str) : m_view{str.c_str()} {}

  // Needed as a workaround for gcc bug #61648
  // Allows non-friend string literal operators the ability to indirectly call the private constructor
  // Safe calling of this requires *certainty* that s[count] is a null character
  // Has to be public thusly, but don't call this
  static constexpr basic_zstring_view _INTERNAL_unsafe_make_from_string_range(const CharT* s, size_type count) {
    return {s, count};
  }

  constexpr basic_zstring_view& operator=(const basic_zstring_view& view) noexcept = default;

  constexpr const_iterator begin() const noexcept { return m_view.begin(); }

  constexpr const_iterator cbegin() const noexcept { return m_view.cbegin(); }

  constexpr const_iterator end() const noexcept { return m_view.end(); }

  constexpr const_iterator cend() const noexcept { return m_view.cend(); }

  constexpr const_reverse_iterator rbegin() const noexcept { return m_view.rbegin(); }

  constexpr const_reverse_iterator crbegin() const noexcept { return m_view.crbegin(); }

  constexpr const_reverse_iterator rend() const noexcept { return m_view.rend(); }

  constexpr const_reverse_iterator crend() const noexcept { return m_view.crend(); }

  constexpr const_reference operator[](size_type pos) const { return m_view[pos]; }

  constexpr const_reference at(size_type pos) const { return m_view.at(pos); }

  constexpr const_reference front() const { return m_view.front(); }

  constexpr const_reference back() const { return m_view.back(); }

  constexpr const_pointer data() const noexcept { return m_view.data(); }

  // Additional function
  constexpr const_pointer c_str() const noexcept { return m_view.data(); }

  constexpr size_type size() const noexcept { return m_view.size(); }

  constexpr size_type length() const noexcept { return m_view.length(); }

  constexpr size_type max_size() const noexcept { return m_view.max_size(); }

  constexpr bool empty() const noexcept { return m_view.empty(); }

  constexpr void remove_prefix(size_type n) { m_view.remove_prefix(n); }

  constexpr void swap(basic_zstring_view& v) noexcept { swap(m_view, v.m_view); }

  size_type copy(CharT* dest, size_type count, size_type pos = 0) const { return m_view.copy(dest, count, pos); }

  constexpr underlying_type substr(size_type pos = 0, size_type count = npos) const {
    return m_view.substr(pos, count);
  }

  // Additional function
  constexpr basic_zstring_view suffix(size_type start = 0) const {
    return basic_zstring_view{m_view.substr(start, npos)};
  }

  constexpr int compare(underlying_type v) const noexcept { return m_view.compare(v); }

  constexpr int compare(size_type pos1, size_type count1, underlying_type v) const {
    return m_view.compare(pos1, count1, v);
  }

  constexpr int compare(size_type pos1, size_type count1, underlying_type v, size_type pos2, size_type count2) const {
    return m_view.compare(pos1, count1, v, pos2, count2);
  }

  constexpr int compare(const CharT* s) const { return m_view.compare(s); }

  constexpr int compare(size_type pos1, size_type count1, const CharT* s, size_type count2) const {
    return m_view.compare(pos1, count1, s, count2);
  }

  constexpr bool starts_with(underlying_type x) const noexcept { return m_view.starts_with(x); }

  constexpr bool starts_with(CharT x) const noexcept { return m_view.starts_with(x); }

  constexpr bool starts_with(const CharT* x) const { return m_view.starts_with(x); }

  constexpr bool ends_with(underlying_type x) const noexcept { return m_view.ends_with(x); }

  constexpr bool ends_with(CharT x) const noexcept { return m_view.ends_with(x); }

  constexpr bool ends_with(const CharT* x) const { return m_view.ends_with(x); }

  constexpr size_type find(underlying_type v, size_type pos = 0) const noexcept { return m_view.find(v, pos); }

  constexpr size_type find(CharT ch, size_type pos = 0) const noexcept { return m_view.find(ch, pos); }

  constexpr size_type find(const CharT* s, size_type pos, size_type count) const { return m_view.find(s, pos, count); }

  constexpr size_type find(const CharT* s, size_type pos = 0) const { return m_view.find(s, pos); }

  constexpr size_type rfind(underlying_type v, size_type pos = npos) const noexcept { return m_view.rfind(v, pos); }

  constexpr size_type rfind(CharT ch, size_type pos = npos) const noexcept { return m_view.rfind(ch, pos); }

  constexpr size_type rfind(const CharT* s, size_type pos, size_type count) const {
    return m_view.rfind(s, pos, count);
  }

  constexpr size_type rfind(const CharT* s, size_type pos = npos) const { return m_view.rfind(s, pos); }

  constexpr size_type find_first_of(underlying_type v, size_type pos = 0) const noexcept {
    return m_view.find_first_of(v, pos);
  }

  constexpr size_type find_first_of(CharT c, size_type pos = 0) const noexcept { return m_view.find_first_of(c, pos); }

  constexpr size_type find_first_of(const CharT* s, size_type pos, size_type count) const {
    return m_view.find_first_of(s, pos, count);
  }

  constexpr size_type find_first_of(const CharT* s, size_type pos = 0) const { return m_view.find_first_of(s, pos); }

  constexpr size_type find_last_of(underlying_type v, size_type pos = npos) const noexcept {
    return m_view.find_last_of(v, pos);
  }

  constexpr size_type find_last_of(CharT c, size_type pos = npos) const noexcept { return m_view.find_last_of(c, pos); }

  constexpr size_type find_last_of(const CharT* s, size_type pos, size_type count) const {
    return m_view.find_last_of(s, pos, count);
  }

  constexpr size_type find_last_of(const CharT* s, size_type pos = npos) const { return m_view.find_last_of(s, pos); }

  constexpr size_type find_first_not_of(underlying_type v, size_type pos = 0) const noexcept {
    return m_view.find_first_not_of(v, pos);
  }

  constexpr size_type find_first_not_of(CharT c, size_type pos = 0) const noexcept {
    return m_view.find_first_not_of(c, pos);
  }

  constexpr size_type find_first_not_of(const CharT* s, size_type pos, size_type count) const {
    return m_view.find_first_not_of(s, pos, count);
  }

  constexpr size_type find_first_not_of(const CharT* s, size_type pos = 0) const {
    return m_view.find_first_not_of(s, pos);
  }

  constexpr size_type find_last_not_of(underlying_type v, size_type pos = npos) const noexcept {
    return m_view.find_last_not_of(v, pos);
  }

  constexpr size_type find_last_not_of(CharT c, size_type pos = npos) const noexcept {
    return m_view.find_last_not_of(c, pos);
  }

  constexpr size_type find_last_not_of(const CharT* s, size_type pos, size_type count) const {
    return m_view.find_last_not_of(s, pos, count);
  }

  constexpr size_type find_last_not_of(const CharT* s, size_type pos = npos) const {
    return m_view.find_last_not_of(s, pos);
  }

  constexpr const underlying_type& view() const noexcept { return m_view; }

  constexpr operator underlying_type() const noexcept { return m_view; }

private:
  // Private constructor, called by the string literal operators
  constexpr basic_zstring_view(const CharT* s, size_type count) : m_view{s, count} {}

  // Private constructor, needed by suffix()
  explicit constexpr basic_zstring_view(const underlying_type& v) noexcept : m_view{v} {}

  underlying_type m_view;
};

template <typename CharT, typename Traits>
constexpr bool operator==(basic_zstring_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs.view() == rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator==(basic_zstring_view<CharT, Traits> lhs, std::basic_string_view<CharT, Traits> rhs) noexcept {
  return lhs.view() == rhs;
}

template <typename CharT, typename Traits>
constexpr bool operator==(std::basic_string_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs == rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator!=(basic_zstring_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs.view() != rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator!=(basic_zstring_view<CharT, Traits> lhs, std::basic_string_view<CharT, Traits> rhs) noexcept {
  return lhs.view() != rhs;
}

template <typename CharT, typename Traits>
constexpr bool operator!=(std::basic_string_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs != rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator<(basic_zstring_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs.view() < rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator<(basic_zstring_view<CharT, Traits> lhs, std::basic_string_view<CharT, Traits> rhs) noexcept {
  return lhs.view() < rhs;
}

template <typename CharT, typename Traits>
constexpr bool operator<(std::basic_string_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs < rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator<=(basic_zstring_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs.view() <= rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator<=(basic_zstring_view<CharT, Traits> lhs, std::basic_string_view<CharT, Traits> rhs) noexcept {
  return lhs.view() <= rhs;
}

template <typename CharT, typename Traits>
constexpr bool operator<=(std::basic_string_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs <= rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator>(basic_zstring_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs.view() > rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator>(basic_zstring_view<CharT, Traits> lhs, std::basic_string_view<CharT, Traits> rhs) noexcept {
  return lhs.view() > rhs;
}

template <typename CharT, typename Traits>
constexpr bool operator>(std::basic_string_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs > rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator>=(basic_zstring_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs.view() >= rhs.view();
}

template <typename CharT, typename Traits>
constexpr bool operator>=(basic_zstring_view<CharT, Traits> lhs, std::basic_string_view<CharT, Traits> rhs) noexcept {
  return lhs.view() >= rhs;
}

template <typename CharT, typename Traits>
constexpr bool operator>=(std::basic_string_view<CharT, Traits> lhs, basic_zstring_view<CharT, Traits> rhs) noexcept {
  return lhs >= rhs.view();
}

template <typename CharT, typename Traits>
auto operator<<(std::basic_ostream<CharT, Traits>& os, basic_zstring_view<CharT, Traits> v) -> decltype(os) {
  return os << v.view();
}

inline namespace literals {
inline namespace zstring_view_literals {
constexpr zstring_view operator""_zsv(const char* str, std::size_t len) noexcept {
  return zstring_view::_INTERNAL_unsafe_make_from_string_range(str, len);
}

constexpr u16zstring_view operator""_zsv(const char16_t* str, std::size_t len) noexcept {
  return u16zstring_view::_INTERNAL_unsafe_make_from_string_range(str, len);
}

constexpr u32zstring_view operator""_zsv(const char32_t* str, std::size_t len) noexcept {
  return u32zstring_view::_INTERNAL_unsafe_make_from_string_range(str, len);
}

constexpr wzstring_view operator""_zsv(const wchar_t* str, std::size_t len) noexcept {
  return wzstring_view::_INTERNAL_unsafe_make_from_string_range(str, len);
}
} // namespace zstring_view_literals
} // namespace literals
} // namespace aurora

template <typename BitType>
class Flags {
public:
  using MaskType = typename std::underlying_type<BitType>::type;

  // constructors
  constexpr Flags() noexcept : m_mask(0) {}

  constexpr Flags(BitType bit) noexcept : m_mask(static_cast<MaskType>(bit)) {}

  constexpr Flags(Flags<BitType> const& rhs) noexcept : m_mask(rhs.m_mask) {}

  constexpr explicit Flags(MaskType flags) noexcept : m_mask(flags) {}

  [[nodiscard]] constexpr bool IsSet(Flags<BitType> const bit) const noexcept { return bool(*this & bit); }

  // relational operators
  bool operator==(Flags<BitType> const& rhs) const noexcept { return m_mask == rhs.m_mask; }

  // logical operator
  constexpr bool operator!() const noexcept { return !m_mask; }

  // bitwise operators
  constexpr Flags<BitType> operator&(Flags<BitType> const& rhs) const noexcept {
    return Flags<BitType>(m_mask & rhs.m_mask);
  }

  constexpr Flags<BitType> operator|(Flags<BitType> const& rhs) const noexcept {
    return Flags<BitType>(m_mask | rhs.m_mask);
  }

  constexpr Flags<BitType> operator^(Flags<BitType> const& rhs) const noexcept {
    return Flags<BitType>(m_mask ^ rhs.m_mask);
  }

  // assignment operators
  constexpr Flags<BitType>& operator=(Flags<BitType> const& rhs) noexcept {
    m_mask = rhs.m_mask;
    return *this;
  }

  constexpr Flags<BitType>& operator|=(Flags<BitType> const& rhs) noexcept {
    m_mask |= rhs.m_mask;
    return *this;
  }

  constexpr Flags<BitType>& operator&=(Flags<BitType> const& rhs) noexcept {
    m_mask &= rhs.m_mask;
    return *this;
  }

  constexpr Flags<BitType>& operator^=(Flags<BitType> const& rhs) noexcept {
    m_mask ^= rhs.m_mask;
    return *this;
  }

  // cast operators
  explicit constexpr operator bool() const noexcept { return m_mask != 0; }

  explicit constexpr operator MaskType() const noexcept { return m_mask; }

private:
  MaskType m_mask;
};
