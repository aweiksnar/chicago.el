;;; chicago-tests.el --- tests for chicago.el

;; License: GPLv3

;;; Code:

(require 'ert)
(require 'chicago)

(ert-deftest chicago ()
  (should (equal 1 1)))

(ert-deftest chicago-add-test ()
  (let ((num (chicago-add-1 3)))
    (should (equal num 4))))

;;; chicago-tests.el ends here
