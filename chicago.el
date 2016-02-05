;;; chicago.el --- Chicago 

;; Copyright (C) 2016 Alex Weiksnar <aweiksnar@gmail.com>

;; Author: Alex Weiksnar
;; URL: https://github.com/aweiksnar/chicago.el
;; Version: 0.1
;; Created: 2016-02-02
;; By: Alex Weiksnar
;; keywords: chicago, emacs
;; Package-Requires: ()

;; chicago.el is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.
;;
;; chicago.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with chicago.el. If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'json)

(defun chicago-forecast-url ()
  "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20%28select%20woeid%20from%20geo.places%281%29%20where%20text%3D%22chicago%2C%20il%22%29&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

(defun chicago-get-json (url)
  "Fetch JSON from a url string. Returns response as a cons list"
  (with-current-buffer (url-retrieve-synchronously url)
    (let ((json-string nil))
      (goto-char url-http-end-of-headers)
      (setq json-string
            (buffer-substring-no-properties
             (point) (point-max)))
      (json-read-from-string json-string))))

(defun chicago-weather-data ()
  (chicago-get-json (chicago-forecast-url)))

(provide 'chicago)

;;; chicago.el ends here
