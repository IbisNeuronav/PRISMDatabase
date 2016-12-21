vec3 sphereCenter = interactionPoint1;
float sphereRadius = 0.2;

vec3 centerDir = sphereCenter - rayStart;
float centerProjDist = dot( centerDir, rayDir );
vec3 centerProj = rayStart + rayDir * centerProjDist;
float distCenterProjCenter = length( centerProj - sphereCenter );
if( distCenterProjCenter < sphereRadius ) // we have an intersection
{
	float dcpc2 = distCenterProjCenter * distCenterProjCenter;
	float sr2 = sphereRadius * sphereRadius;
	float intersectDistance = centerProjDist + sqrt( sr2 - dcpc2 );
	if( intersectDistance > 0.0 )
		currentDistance = intersectDistance;
}