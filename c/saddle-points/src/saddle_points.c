#include "saddle_points.h"
#include <stdlib.h>

saddle_points_t *saddlePoints(const unsigned int rows, const unsigned int cols, uint8_t matrix[rows][cols]) {
    static saddle_points_t saddle_points;
    saddle_point_t * pts = malloc(rows*cols * sizeof(saddle_point_t));
    saddle_points.count = 0;
    saddle_points.points = pts;


    return &saddle_points;

}