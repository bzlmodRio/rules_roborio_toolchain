

#ifdef __FRC_ROBORIO__

#if IS_ROBORIO_TEST
#error "This shouldn't happen"
#endif

#else

#if IS_ROBORIO_TEST
#error "This shouldn't happen"
#endif

#endif

#include <iostream>

int main() {
    std::cout << "Hello world: " << IS_ROBORIO_TEST << ", " << std::endl;
#ifdef __FRC_ROBORIO__
    std::cout << "Roborio: " << __FRC_ROBORIO__ << std::endl;
#endif
    
#ifdef __FRC_ROBORIO__

std::cout << "YYYY" << std::endl;

#else
std::cout << "XXXX" << std::endl;

#endif

    return 0;
}