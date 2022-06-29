//create mover with an object target
//format path as [ [x,y], [x1,y1] ]
//format speed as a N or [N, N1, N2, N3]
//object is what you want to move
//loop is whether to loop the path
//destroy mover object when path is finished? (disallows restart)
function mover_create(path, speed, object, loop = false, destroy = false) {
	var a = instance_create_depth(0, 0, 0, obj_mover);
	with (a) {
		_path = path;	
		if (!is_array(speed)) _speed = [speed];
		else _speed = speed;
		_obj = object;
		_loop = loop;
		_destroy = destroy;
	}
	return a;
}
//restart path to the first node
function mover_restart(object) {
	if instance_exists(obj_mover) {
		with (obj_mover) {
			if (_obj == object) {
				_index = 0;
				_finished = false;
			}
		}
	}
	return;
}
//check whether mover is finished
function mover_finished(object) {
	if instance_exists(obj_mover) {
		with (obj_mover) {
			if (_obj == object) return _finished;
		}
	}
	return false;
}
//destroy mover related to an object
function mover_destroy(object) {
	if instance_exists(obj_mover) {
		with (obj_mover) {
			if (_obj == object) instance_destroy(id);
		}
	}
	return;
}
//pause object movement once it reaches closest node
function mover_pause_node(object) {
	if instance_exists(obj_mover) {
		with (obj_mover) {
			if (_obj == object) _pause_node = true;
		}
	}
	return;
}
//pause object movement immediately where it is
function mover_pause_place(object) {
	if instance_exists(obj_mover) {
		with (obj_mover) {
			if (_obj == object) _pause_place = true;
		}
	}
	return;
}
//unpause from any pause state and resume movement
function mover_unpause(object) {
	if instance_exists(obj_mover) {
		with (obj_mover) {
			if (_obj == object){
				_pause_node = false;
				_pause_place = false;
			}
		}
	}
	return;
}