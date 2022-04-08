export const calculateNewRating = (rating_sum, total_reviews) => {
    if (total_reviews == 0) {
        return 0;
    } else if (total_reviews == 1) {
        return rating_sum;
    } else {
        return rating_sum / total_reviews;
    }
}