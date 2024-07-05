A = [10, 7, 8, 7; 7, 5, 6, 5; 8, 6, 10, 9; 7, 5, 9, 10];
b = [32; 23; 33; 31];
x = A\b;

fprintf("A:");
disp(A);
fprintf("b:")
disp(b);
fprintf("x:");
disp(x);

% perturbare b 
b_p = [32.1; 22.9; 33.1; 30.9];
x_p1 = A\b_p;
err_intrare1 = norm(b - b_p) / norm(b);
err_iesire1 = norm(x - x_p1) / norm(x);
ratio1 = err_iesire1 / err_intrare1;
fprintf("Eroarea relativa la intrare cand b este perturbat %f\n", err_intrare1);
fprintf("Eroarea relativa la iesire cand b este perturbat %f\n", err_iesire1);
fprintf("Eroarea pentru b %f\n", ratio1);
% eroarea se amplifica de aproximativ 2460 ori => problema prost conditionata

fprintf("\n");

% perturbare A
A_p = [10,7,8.1,7.2;7.08,5.04,6,5;8,5.98,9.89,9;6.99,4.99,9,9.98];
x_p2 = A_p\b;
err_intrare2 = norm(A - A_p) / norm(A);
err_iesire2 = norm(x - x_p2) / norm(x);
ratio2 = err_iesire2 / err_intrare2;
fprintf("Eroarea relativa la intrare cand matricea A este perturbata %f\n", err_intrare2);
fprintf("Eroarea relativa la iesire cand matricea A este perturbata %f\n", err_iesire2);
fprintf("Eroarea pentru A %f\n", ratio2);
