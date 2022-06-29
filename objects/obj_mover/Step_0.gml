if (_obj != noone) {
	var arr_sp = array_length(_speed)-1,
	arr_path = array_length(_path)-1,
	xx = _path[_index][0], 
	yy = _path[_index][1],
	sp = _speed[clamp(_index, 0, arr_sp)]
	
	//destroy self if target object is gone
	if (!instance_exists(_obj)) {
		instance_destroy();
		exit;
	}
	with (_obj) {
		//move if not pause place
		if (!other._pause_place) {
			if point_distance(x, y, xx, yy) > 1 { //if node is not reached
				move_to(xx, yy, sp); //speed per node until end of length
			}
			else { //if node reached
				if (!other._pause_node) {
					if (other._index+1 <= arr_path) {
						other._index++;	
					}
					else {
						//if loop, restart
						if (other._loop) other._index = 0;
						//if not loop, finish
						else {
							speed = 0;
							other._finished = true;
						}
						//destroy mover if destroy
						if (other._destroy) instance_destroy(other)
					}
				}
				//stop if pause node
				else {
					speed = 0;
					//finish too if last node
					if (other._index+1 > arr_path) {
						other._finished = true;
					}
				}
			}
		}
		//stop if pause place
		else {
			speed = 0;
		}
	}
}