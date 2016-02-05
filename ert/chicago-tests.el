;;; chicago-tests.el --- tests for chicago.el

;; License: GPLv3

;;; Code:

(load-file "~/elisp/chicago.el/chicago.el")
(require 'ert)
(require 'chicago)

(ert-deftest chicago-weather-data-test ()
  (let ((data (chicago-weather-data)))
    (should (equal (type-of data) 'cons))
    (should (equal (car (car data)) 'query))))

;;; chicago-tests.el ends here
