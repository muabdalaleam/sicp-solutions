(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; normal-evaluation with subtitution model
;; (gcd 206 40)
;;  (if (= 40 0)
;;      206
;;      (gcd 40 (remainder 206 40))) # 1
