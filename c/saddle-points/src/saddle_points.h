#ifndef SADDLE_POINTS_H
#define SADDLE_POINTS_H

#include <stdint.h>

typedef struct saddle_point {
    unsigned int row;
    unsigned int column;
} saddle_point_t;

typedef struct saddle_points {
    unsigned int count;
    saddle_point_t * points;
} saddle_points_t;

saddle_points_t *saddlePoints(const unsigned int rows, const unsigned int cols, uint8_t matrix[rows][cols]);

#endif
