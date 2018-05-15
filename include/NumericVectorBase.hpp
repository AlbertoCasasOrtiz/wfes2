#pragma once

#include "common.hpp"

template <typename T>
class NumericVectorBase {
protected:
	bool valid = true;
public:
	llong stride;
	T* values;

	llong size;

	explicit NumericVectorBase(llong size, llong stride, T* values): stride(stride), values(values), size(size) {}
	
	explicit NumericVectorBase(llong size, T init = 0, llong stride = 1): stride(stride), values(nullptr), size(size) {

		values = (T*)calloc(size * stride, sizeof(T));
		assert(values != NULL);
		if (init != 0) {
			for(llong i = 0; i < (size * stride); i += stride) {
				values[i] = init;
			}
		}
	}

	NumericVectorBase(NumericVectorBase&) = delete;
	NumericVectorBase(const NumericVectorBase&) = delete;

	NumericVectorBase(NumericVectorBase&&) = delete;
	NumericVectorBase(const NumericVectorBase&&) = delete;

	T& operator()(llong i) { return values[i * stride]; }
	const T& operator()(llong i) const { return values[i * stride]; }

	T sum() const {
		T s = 0;
		for(llong i = 0; i < size; i++) {
			s += values[i * stride];
		}
		return s;
	}

	T normalize() {
		T s = sum();	
		for(long i = 0; i < size; i++) {
			values[i * stride] /= s;
		}
		return s;
	}

	virtual ~NumericVectorBase() = 0;

};

template <typename T>
NumericVectorBase<T>::~NumericVectorBase() {
}

template <typename T>
std::ostream& operator<<(std::ostream& os, const NumericVectorBase<T>& x) {
	os << x(0);
	for(llong i = 1; i < x.size; i++) {
		os << "\t" << x(i);
	}
	return os;
}

template <typename T>
inline bool operator==(const NumericVectorBase<T>& lhs, const NumericVectorBase<T>& rhs) { 
	bool all = false;
	if(lhs.size != rhs.size) { return false; }
	for(llong i = 0; i < lhs.size; i++) {
		all = (lhs(i) == rhs(i));
	}
	return all;
}

template <typename T>
inline bool operator!=(const NumericVectorBase<T>& lhs, const NumericVectorBase<T>& rhs) { 
	return !(lhs == rhs); 
}
