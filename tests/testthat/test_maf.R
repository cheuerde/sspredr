context("MAF input")
test_that("arguments play nice", {
  expect_error(compute_maf(marker_numeric, output = "markerNames",
                           missing = "??",
                           mafThresh = 0),
               regexp = "Classes of 'missing' and 'x' must be the same")
  expect_error(compute_maf(marker_character, output = "markerNames",
                         missing = NA_real_,
                         mafThresh = 0),
             regexp = "Classes of 'missing' and 'x' must be the same")
})

test_that("numeric and character values are supported", {
  expect_identical(compute_maf(marker_numeric, output = "markerNames",
                               missing = NA_real_,
                               mafThresh = 0),
                   compute_maf(marker_character, output = "markerNames",
                               missing = "??",
                               mafThresh = 0))
})

context("MAF output")
test_that("output structure is correct", {
  expect_length(compute_maf(marker_numeric, output = "markerNames",
                            missing = NA_real_,
                            mafThresh = 0),
                n = ncol(marker_numeric))
})

