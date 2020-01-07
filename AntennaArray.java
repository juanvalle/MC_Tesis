package org.moeaframework.problem.AntennaArray;

import java.util.Arrays;
import java.util.concurrent.ThreadLocalRandom;

import org.apache.commons.math3.complex.Complex;
import org.moeaframework.core.Solution;

class AntennaArray {
	private AntennaArray() {
		super();
	}
	
	public static void LinearArray(Solution solution, byte[] perm, double d, double theta, 
			double theta_0, double[] f, double beamwidth, double sll, double[] p) {
		
		double[] afactor = new double[1801],
				 afactor2 = new double[1801],
				 anorm = new double[1801];
		
		byte elements = AntennaArrayUtils.antelem_sum(perm);
		
		Complex[] AF = new Complex[1801], 
				  PP = new Complex[elements],
				  PPtemp1 = new Complex[elements], 
				  PPtemp2 = new Complex[1801];	
		
		double[] cos_taper = new double[elements],
				 phases = new double[elements];
		
		double dtemp1, dtemp2, dtemp3, dtemp4;
		Complex ctemp1;
		
		phases = AntennaArrayUtils.centers(perm, d, elements);
		
		for(int m = 0; m < elements; m++) {
			dtemp1 = Math.cos((Math.PI/0.25)*((((phases[m]-1)/(phases[elements-1]))/4) - 
					((1 - 0.25)/2))); //check tapper
			dtemp2 = 0.5*(1 + Math.pow(dtemp1, 2));
			cos_taper[m] = Math.abs(dtemp2);
			dtemp3 = -2*Math.PI*d*(phases[m]-1)*Math.sin(theta * (Math.PI/180));
			PPtemp1[m] = new Complex(Math.cos(dtemp3), Math.sin(dtemp3));
			PP[m] = PPtemp1[m].multiply(cos_taper[m]);
			
			for(int h = 0; h < p.length; h++) {
				dtemp4 = 2*Math.PI*m*d*Math.sin(p[h]);
				PPtemp2[h] = new Complex(Math.cos(dtemp4), Math.sin(dtemp4));
				if (m == 0) {
					AF[h] = PPtemp2[h].multiply(PP[m]);
				} else {
					ctemp1 = AF[h];
					AF[h] = ctemp1.add(PPtemp2[h].multiply(PP[m]));
				}
			}
		}
		
		double max = 0;
		int max_index = 0;
		
		for(int i = 0; i < p.length; i++) {	// change method
			afactor[i] = AF[i].abs();
			if (afactor[i] > max && afactor[i] != Double.NaN) {
				max = afactor[i];
				max_index = i;
			}
		}

		for(int j = 0; j < p.length; j++) { 
			afactor2[j] = afactor[j] / max; 
			anorm[j] = 20*Math.log10(afactor2[j]);
		}
		
		boolean flag1 = false, 
				flag2 = false;
		
		int p1, p2, q1, q2;
		
		if(max_index == 0) max_index = 1;
		
		p1 = max_index;
		p2 = p1 - 1;
		
		while(afactor2[p1] > afactor2[p2]) {
			if (p2 <= 2) {
				p1 = 1800;
				p2 = p1 - 1;
				flag1 = true;
			} else {
				p1 = p2;
				p2 = p1 - 1;
			}
		}
		
		int tmp1 = p1;
		
		if(max_index >= 1800) max_index = 0;
		
		q1 = max_index;
		q2 = q1 + 1;
			
		while(afactor2[q1] > afactor2[q2]) {
			if(q2 >= 1799) {
				q1 = 0;
				q2 = q1 + 1;
				flag2 = true;
			} else {
				q1 = q2;
				q2 = q1 + 1;
			}
		}
		
		int tmp2 = q1,
			right_point, 
			left_point,
			mainlobe_index;
		
		if(flag1 || flag2) {
			right_point = tmp1;
			left_point = tmp2;
			
			Arrays.sort(anorm, 901, right_point);
			Arrays.sort(anorm, left_point, 900);
			
			// Beamwidth in radians
			beamwidth = ((Math.abs(p[0]) - Math.abs(p[left_point])) + 
					(p[1800] - p[right_point]));
			
			sll = Math.max(anorm[right_point-1], anorm[899]);
			
		} else {
			right_point = tmp2;
			left_point = tmp1;
			
			mainlobe_index = getMaxSllIndex(anorm, left_point, right_point);
			
			// Beamwidth in radians
			beamwidth = Math.abs(p[right_point] - p[left_point]);
			
			sll = Math.max(getMaxSll(anorm, right_point, 1800),
					getMaxSll(anorm, 0, left_point));
			
			/*theta_0 = Math.abs(p[mainlobe_index] - p[(int) (Math.round(
					(theta*(Math.PI/180))/((Math.PI/2)/900)) + 900)]);

			sll = Math.max(anorm[1799], anorm[left_point-1]);*/
		}
		
		//solution.setConstraint(0, sll > -13 ? sll : 0);
		//solution.setConstraint(1, theta_0 > 0.0174533 ? theta_0 : 3);
		
		solution.setAttribute("sll", sll);
		solution.setAttribute("beamwidth", beamwidth);
	}

	public static void randomPhase(byte[] seq, double[] phases) {
		int count = 0;
		double rand1;
		for(int i = 0; i < seq.length; i++) {
			rand1 = ThreadLocalRandom.current().nextDouble((-Math.PI), 0.001);
			for(int j = 0; j < seq[i]; j++) {
				phases[count] = rand1;
				count++;
			}
		}
	}
	
	/*public static void intervalPhase(byte[] seq, double[] phases) {
		int count = 0;
		double rand1;
		for(int i = 0; i < seq.length; i++) {
			rand1 = ThreadLocalRandom.current().nextDouble(AntennaArrayUtils.pc5[count], 
					AntennaArrayUtils.pc45[count]);
			for(int j = 0; j < seq[i]; j++) {
				phases[count] = rand1;
				count++;
			}
		}
	}*/
	
	public static double getMaxSll(double[] anorm, int point, int bound) {
		double[] copy = Arrays.copyOfRange(anorm, point, bound);
		Arrays.sort(copy);
		
		return copy[copy.length-1];
	}
	
	public static int getMaxSllIndex(double[] anorm, int left, int right) {
		double max = -1;
		int max_index = 0;
		
		for(int i = left; i < right+1; i++) {
			if (anorm[i] > max && anorm[i] != Double.NaN) {
				max = anorm[i];
				max_index = i;
			}
		}

		return max_index;
	}
	
	public static void LinearArrayPhaseGrouping(Solution solution, byte[] perm, double d, double theta, 
			double theta_0, double[] f, double beamwidth, double sll, double[] p) {
		double[] afactor = new double[1801],
				 afactor2 = new double[1801],
				 anorm = new double[1801];
		
		byte elements = AntennaArrayUtils.antelem_sum(perm);
		
		Complex[] AF = new Complex[1801], 
				  PP = new Complex[elements],
				  PPtemp1 = new Complex[elements], 
				  PPtemp2 = new Complex[1801];	
		
		double[] cos_taper = new double[elements],
				 phases = new double[elements],
				 phase_vector = new double[elements];
		double dtemp1, dtemp2, dtemp3, dtemp4, tmp3;
		Complex ctemp1;
		
		int index = 0;
		
		phases = AntennaArrayUtils.centers(perm, d, elements);
		
		for(int m = 0; m < elements; m++) {
			dtemp1 = Math.cos((Math.PI/0.25)*((((phases[m]-1)/(phases[elements-1]))/4) - 
					((1 - 0.25)/2))); //check tapper
			dtemp2 = 0.5*(1 + Math.pow(dtemp1, 2));
			cos_taper[m] = Math.abs(dtemp2); // check 14/11/18
			dtemp3 = -2*Math.PI*d*(phases[m]-1)*Math.sin(theta * (Math.PI/180));
			index = Math.abs(Arrays.binarySearch(AntennaArrayUtils.phaseshifter_radians, 
					Math.abs(dtemp3) % 2*Math.PI));
			if (index != 0 && index <= AntennaArrayUtils.phaseshifter_radians.length) {
				index--;
			} else if (index > AntennaArrayUtils.phaseshifter_radians.length) {
				index = 0;
			}

			dtemp3 = AntennaArrayUtils.phaseshifter_radians[index];
			phase_vector[m] = dtemp3;
			
			PPtemp1[m] = new Complex(Math.cos(dtemp3), Math.sin(dtemp3));
			PP[m] = PPtemp1[m].multiply(cos_taper[m]);
			
			for(int h = 0; h < p.length; h++) {
				dtemp4 = 2*Math.PI*m*d*Math.sin(p[h]);
				PPtemp2[h] = new Complex(Math.cos(dtemp4), Math.sin(dtemp4));
				if (m == 0) {
					AF[h] = PPtemp2[h].multiply(PP[m]);
				} else {
					ctemp1 = AF[h];
					AF[h] = ctemp1.add(PPtemp2[h].multiply(PP[m]));
				}
			}
		}

		double[] p_vector = phaseGrouping(perm, phase_vector, index);
		solution.setAttribute("p_vector", p_vector);
		solution.setAttribute("phases", phase_vector);
		
		
		double max = 0;
		int max_index = 0;
		
		for(int i = 0; i < p.length; i++) {	// change method
			afactor[i] = AF[i].abs();
			if (afactor[i] > max && afactor[i] != Double.NaN) {
				max = afactor[i];
				max_index = i;
			}
		}

		for(int j = 0; j < p.length; j++) { 
			afactor2[j] = afactor[j] / max; 
			anorm[j] = 20*Math.log10(afactor2[j]);
		}
		
		boolean flag1 = false, 
				flag2 = false;
		
		int p1, p2, q1, q2;
		
		if(max_index == 0) max_index = 1;
		
		p1 = max_index;
		p2 = p1 - 1;
		
		while(afactor2[p1] > afactor2[p2]) {
			if (p2 <= 2) {
				p1 = 1800;
				p2 = p1 - 1;
				flag1 = true;
			} else {
				p1 = p2;
				p2 = p1 - 1;
			}
		}
		
		int tmp1 = p1;
		
		if(max_index >= 1800) max_index = 0;
		
		q1 = max_index;
		q2 = q1 + 1;
			
		while(afactor2[q1] > afactor2[q2]) {
			if(q2 >= 1799) {
				q1 = 0;
				q2 = q1 + 1;
				flag2 = true;
			} else {
				q1 = q2;
				q2 = q1 + 1;
			}
		}
		
		int tmp2 = q1,
			right_point, 
			left_point,
			mainlobe_index;
		
		if(flag1 || flag2) {
			right_point = tmp1;
			left_point = tmp2;
			
			Arrays.sort(anorm, 901, right_point);
			Arrays.sort(anorm, left_point, 900);
			
			// Beamwidth in radians
			beamwidth = ((Math.abs(p[0]) - Math.abs(p[left_point])) + 
					(p[1800] - p[right_point]));
			
			sll = Math.max(anorm[right_point-1], anorm[899]);
			
		} else {
			right_point = tmp2;
			left_point = tmp1;
			
			mainlobe_index = getMaxSllIndex(anorm, left_point, right_point);
			
			// Beamwidth in radians
			beamwidth = Math.abs(p[right_point] - p[left_point]);
			
			sll = Math.max(getMaxSll(anorm, right_point, 1800),
					getMaxSll(anorm, 0, left_point));

		}
		
		solution.setAttribute("sll", sll);
		solution.setAttribute("beamwidth", beamwidth);
	}
	
	public static double[] density(byte[] seq) {
		int n = seq.length,
			v = Math.round(n/3);
		
		double[] d = new double[n];

		for(int l = 0; l < n-2; l++) {
			int v_elem = 0;
			if(l == 0) {
				for(int j = 0; j < v; j++) {
					v_elem += seq[j];
				}
				d[l] = v_elem / (v*4); 
			} else if(l == 1) {
				for(int j = 0; j < v; j++) {
					v_elem += seq[j];
				}
				d[l] = v_elem / (v*4); 
			}
		}
		
		return d;
	}
	
	public static double[] phaseGrouping(byte[] seq, double[] phases, int index) {
		int offset = 0, 
			count = 0; 
		
		double[] ph = new double[seq.length],
				 bound = new double[seq.length];
		
		for(int i = 0; i < seq.length; i++) {
			ph[count] = phases[offset];
			offset += seq[i];
			count++;
		}

		bound = Arrays.copyOf(ph, ph.length);	// 0.09817477*2	
		
		return ph;
	}
}
