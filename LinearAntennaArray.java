package org.moeaframework.problem.AntennaArray;

//import java.util.Arrays;
//import java.util.concurrent.ThreadLocalRandom;

import org.moeaframework.core.Solution;
import org.moeaframework.core.variable.EncodingUtils;
import org.moeaframework.core.variable.RealVariable;
import org.moeaframework.problem.AbstractProblem;

public class LinearAntennaArray extends AbstractProblem {
	
	public static int PS = 10;

	public LinearAntennaArray() {
		this(PS);
	}
	
	public LinearAntennaArray(int numberOfVariables) {
		super(numberOfVariables, 2);
	}
	
	public LinearAntennaArray(int numberOfVariables, int numberOfObjectives) {
		super(numberOfVariables, numberOfObjectives);
	}

	@Override
	public void evaluate(Solution solution) {
		double[] f = new double[2],
				 p = new double[1801];
		
		byte[] sequence = new byte[PS];

		double d = 0.5,
			   beamwidth = 0.0, 
			   sll = 0.0,
			   theta = 10,
			   theta_0 = 0;
		
		p[0] = (double)(-Math.PI/2);
		for(int i = 1; i < p.length; i++) { 
			p[i] = p[i-1] + (double)(Math.PI/1800); 
		}
		
		/*
		 * Each permutation represents the number of elements per phase shifter or sub-array
		 * */
		
		for(int i = 0; i < PS; i++) {
			sequence[i] = (byte) Math.floor(EncodingUtils.getReal(solution.getVariable(i)));
		}
		
		solution.setAttribute("sequence", sequence);

		
		AntennaArray.LinearArray(solution, sequence, d, theta, theta_0, f, beamwidth, sll, p);
		
		f[0] = (double) solution.getAttribute("sll");
		f[1] = (double) solution.getAttribute("beamwidth");
		
		solution.setObjectives(f);
	}

	@Override
	public Solution newSolution() {
		Solution solution = new Solution(PS, 2);

		for(int i = 0; i < PS; i++) {
			solution.setVariable(i, new RealVariable(1.0, 4.9999));
		}
		
		return solution;
	}
}
