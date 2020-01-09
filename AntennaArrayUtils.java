package org.moeaframework.problem.AntennaArray;

import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import org.apache.commons.math3.complex.Complex;

public class AntennaArrayUtils {
	static int PS = 10;
		   //k2 = 4, 
		   //k3 = 4,
		   //k4 = 4,
		   //PS = k2+k3+k4;
	
	
	/*
	
	Valores discretos en radianes de un desfasador de 6 bits.
	
	*/
	
	public static double[] phaseshifter_radians = {
		0.00000000, 0.09817477, 0.19634954, 0.29452431, 0.39269908, 
		0.49087385, 0.58904862, 0.68722339, 0.78539816, 0.88357293, 
		0.98174770, 1.07992247, 1.17809725, 1.27627202, 1.37444679, 
		1.47262156, 1.57079633, 1.66897110, 1.76714587, 1.86532064, 
		1.96349541, 2.06167018, 2.15984495, 2.25801972, 2.35619449, 
		2.45436926, 2.55254403, 2.65071880, 2.74889357, 2.84706834, 
		2.94524311, 3.04341788, 3.14159265, 3.23976742, 3.33794219, 
		3.43611696, 3.53429174, 3.63246651, 3.73064128, 3.82881605, 
		3.92699082, 4.02516559, 4.12334036, 4.22151513, 4.31968990, 
		4.41786467, 4.51603944, 4.61421421, 4.71238898, 4.81056375, 
		4.90873852, 5.00691329, 5.10508806, 5.20326283, 5.30143760,
		5.39961237, 5.49778714, 5.59596191, 5.69413668, 5.79231146, 
		5.89048623, 5.98866100, 6.08683577, 6.18501054
	};
	
	/*
	
	Valores de distribución de probabilidad para diferentes casos de n y theta. Estos valores determinan la probabilidad de
	contar con j elementos de antena en determinado subarreglo.
	
	*/
	
	public static byte[] probSeq() {
		byte[] seq = new byte[PS];
		double[][] distribution = {
			/*{0.1, 0.2, 0.2, 0.01, 0.2, 0.1, 0.1, 0.3, 0.1},
			{0.4, 0.79, 0.69, 0.79, 0.79, 0.79, 0.98, 0.79, 0.3},
			{0.7, 0.99, 0.99, 0.99, 0.99, 0.99, 0.99, 0.99, 0.6} ---- */
			
			/*{0.01, 0.01, 0.05, 0.01, 0.01, 0.05},
			{0.02, 0.21, 0.30, 0.26, 0.36, 0.35},
			{0.22, 0.51, 0.50, 0.56, 0.56, 0.70}  // n = 6, theta = 5° */
				
			/*{0.05, 0.01, 0.01, 0.05, 0.01, 0.01, 0.01},
			{0.05, 0.21, 0.16, 0.30, 0.21, 0.36, 0.31},
			{0.35, 0.46, 0.51, 0.60, 0.56, 0.51, 0.51}  // n = 7, theta = 5° */
				
			/*{0.0278, 0.0278, 0.01, 0.0278, 0.01, 0.01, 0.01, 0.0843},
			{0.0833, 0.25, 0.177, 0.306, 0.399, 0.204, 0.093, 0.343},
			{0.3056, 0.472, 0.51, 0.694, 0.788, 0.593, 0.51, 0.621}  // n = 8, theta = 5° */
			
			/*{0.042, 0.01, 0.042, 0.042, 0.01, 0.0417, 0.01, 0.01, 0.01},
			{0.083, 0.135, 0.125, 0.250, 0.468, 0.333, 0.177, 0.218, 0.26},
			{0.375, 0.385, 0.375, 0.542, 0.718, 0.583, 0.718, 0.593, 0.51}  // n = 9, theta = 5° */
			
			{0.059, 0.059, 0.059, 0.059, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01},
			{0.059, 0.118, 0.177, 0.235, 0.245, 0.363, 0.128, 0.304, 0.245, 0.128},
			{0.177, 0.471, 0.353, 0.412, 0.716, 0.598, 0.539, 0.539, 0.539, 0.363}  // n = 10, theta = 5°
		};
		
		for(int i = 0; i < PS; i++) {
			seq[i] = probSub(distribution, i);
		}
		
		return seq;
	}
	
	public static byte probSub(double[][] dist, int index) {
		double prob = ThreadLocalRandom.current().nextDouble(0, 1);
		
		if (prob < dist[0][index]) {
			return 1;
		} else if(prob > dist[0][index] && prob < dist[1][index]) {
			return 2;
		} else if(prob > dist[1][index] && prob < dist[2][index]) {
			return 3;
		} else {
			return 4;
		}
	}
	
	public static byte[] randomAllSeq() {
		byte[] seq = new byte[PS];
		
		for(int b = 0; b < PS; b++) {
			seq[b] = (byte) ThreadLocalRandom.current().nextInt(1, 5);
		}
		
		return seq;
	}
	
	public static byte[] randSeqConstruct() {
		byte[] startseq = {2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4}; // PS = 12
		//byte[] startseq = {2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3}; // PS = 12
		//byte[] startseq = {2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3}; // PS = 18
		Random rand = ThreadLocalRandom.current();
		
		/*
		  
		  Fisher-Yates shuffle algorithm O(n) 
		 
		 */
		
		for(int i = startseq.length-1; i > 0; i--) {
			int index = rand.nextInt(i+1);
	      
			// Simple swap
	      		byte a = startseq[index];
	      		startseq[index] = startseq[i];
	      		startseq[i] = a;
	    }
		
		return Arrays.copyOf(startseq, PS);
	}
	
	public static double[] centers(byte[] seq, double d, byte elements) {
		double[] phases = new double[elements];
		
		int phase_count = 1,
		    subarray,
		    count1 = 1;
		
		double distance = 0,
		       totdist = 0;
			
		for(int a = 0; a < seq.length; a++) {
			subarray = seq[a];
			if(subarray == 1){
				if(count1 == 1) {
					distance = 0;
					totdist = (d/2);
				} else{
					distance = totdist + d;
					totdist += d;
				}
			} else if(subarray == 2){
				if(count1 == 1){
					distance = (d/2);
					totdist = d;
				} else{
					distance = totdist + d + (d/2);
					totdist += (2*d);
				}
			} else if(subarray== 3) {
				if(count1 == 1){
					distance = d;
					totdist = (2*d);
				} else{
					distance = totdist + (2*d);
					totdist += (3*d);
				}
			} else if(subarray == 4){
				if(count1 == 1){
					distance = d + (d/2);
					totdist = (3*d);
				} else{
					distance = totdist + (2*d) + (d/2);
					totdist += (4*d);
				}
			}
			
			count1 += 1;
			    
			for(int i = 0; i < subarray; i++) {
				phases[(phase_count - 1) + i] = distance*2;
			}
			
			phase_count += subarray;
		}
		
		return phases;
	}
	
	public static byte antelem_sum(byte[] seq) {
		byte tmp = 0;
		
		for(int i = 0; i < seq.length; i++) {
			tmp += seq[i];
		}
		
		return tmp;
	}
	
}
