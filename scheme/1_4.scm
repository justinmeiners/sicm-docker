(define ((L-free-particle mass) local)
  (let ((v (velocity local)))
    (* 1/2 mass (dot-product v v))))

(define q
  (up (literal-function 'x)
      (literal-function 'y)
      (literal-function 'z)))

(print-expression (q 't))

(print-expression ((D q) 't))

(define (Lagrangian-action L q t1 t2)
  (definite-integral (compose L (Gamma q)) t1 t2))

(define (test-path t)
  (up (+ (* 4 t) 7)
      (+ (* 3 t) 5)
      (+ (* 2 t) 1)))

(display (Lagrangian-action (L-free-particle 3.0) test-path 0.0 10.0))

; ((f q) t)

; g(epsilon) = f(q + epsilon * eta)
; Dg(0)

(define (((delta eta) f) q)
  (define (g epsilon) (f (+ q (* epsilon eta))))
  ((D g) 0))


;(print-expression ( ( (delta (literal-function 'eta)) (literal-function 'q)) 't) )
;(print-expression ( ((delta (literal-function 'eta)) (literal-function 'q)) 't))

(define (((delta eta) f) q)
  (define (g epsilon)
    (f (+ q (* epsilon eta))))
    ((D g) 0))

(define (f q)
  (compose (literal-function 'f (-> (UP Real Real Real) Real))
           (Gamma q)))

(define eta (literal-function 'eta))
(define q (literal-function 'q))

(print-expression ((((delta eta) f) q) 't))
