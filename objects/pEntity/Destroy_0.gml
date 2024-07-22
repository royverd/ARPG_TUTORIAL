/// @desc Drop Fragments &/or Items

if (entFragmentCount > NULL)
{
	fragmentArray = array_create(entFragmentCount, entFragment);
	DropItems(x, y, fragmentArray);
}



