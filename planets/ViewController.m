//
//  ViewController.m
//  planets
//
//  Created by Paul Fordham on 6/17/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "ViewController.h"
#import "Planets.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray* planetsArray;
}

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // populate table with planet data
    
    Planets* mercury = [Planets new];
    mercury.name = @"Mercury";
    mercury.planetNum = @"1st planet from the sun.";
    mercury.info = @"Mercury is the smallest planet in the Solar System and the one closest to the Sun, with an orbital period of about 88 Earth days, which is much faster than any other planet in the Solar System. Seen from Earth, it appears to move around its orbit in about 116 days. It has no known natural satellites. It is named after the Roman deity Mercury, the messenger to the gods.";
    mercury.imageFile = @"mercury.jpg";

    Planets* venus = [Planets new];
    venus.name = @"Venus";
    venus.planetNum =@"2nd planet from the sun";
    venus.info = @"Venus is the second planet from the Sun, orbiting it every 224.7 Earth days. It has the longest rotation period (243 days) of any planet in the Solar System and rotates in the opposite direction to most other planets. It has no natural satellite. It is named after the Roman goddess of love and beauty. It is the second-brightest natural object in the night sky after the Moon, reaching an apparent magnitude of −4.6, bright enough to cast shadows. Because Venus is an inferior planet from Earth, it never appears to venture far from the Sun; its elongation reaches a maximum of 47.8°.";
    venus.imageFile = @"venus.jpg";
    
    Planets* earth = [Planets new];
    earth.name = @"Earth";
    earth.planetNum = @"3rd planet from the sun.";
    earth.info = @"Earth (otherwise known as the world, in Greek: Γαῖα Gaia, or in Latin: Terra) is the third planet from the Sun, the densest planet in the Solar System, the largest of the Solar System's four terrestrial planets, and the only astronomical object known to harbor life.";
    earth.imageFile = @"earth.jpg";
    
    Planets* mars = [Planets new];
    mars.name = @"Mars";
    mars.planetNum = @"4th planet from the sun.";
    mars.info = @"Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, after Mercury. Named after the Roman god of war, it is often referred to as the Red Planet because the iron oxide prevalent on its surface gives it a reddish appearance. Mars is a terrestrial planet with a thin atmosphere, having surface features reminiscent both of the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.";
    mars.imageFile = @"mars.jpg";
    
    Planets* jupiter = [Planets new];
    jupiter.name = @"Jupiter";
    jupiter.planetNum = @"5th Planet from the sun.";
    jupiter.info = @"Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a giant planet with a mass one-thousandth that of the Sun, but two and a half times that of all the other planets in the Solar System combined. Jupiter is a gas giant, along with Saturn, with the other two giant planets, Uranus and Neptune, being ice giants. Jupiter was known to astronomers of ancient times. The Romans named it after their god Jupiter. When viewed from Earth, Jupiter can reach an apparent magnitude of −2.94, bright enough for its reflected light to cast shadows, and making it on average the third-brightest object in the night sky after the Moon and Venus.";
    jupiter.imageFile = @"jupiter.jpg";
    
    Planets* saturn = [Planets new];
    saturn.name = @"Saturn";
    saturn.planetNum = @"6th planet from the sun.";
    saturn.info = @"Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth. Although only one-eighth the average density of Earth, with its larger volume Saturn is just over 95 times more massive. Saturn is named after the Roman god of agriculture; its astronomical symbol (♄) represents the god's sickle.";
    saturn.imageFile = @"saturn.jpg";
    
    Planets* uranus = [Planets new];
    uranus.name = @"Uranus";
    uranus.planetNum = @"7th planet from the sun.";
    uranus.info = @"Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. Uranus is similar in composition to Neptune, and both have different bulk chemical composition from that of the larger gas giants Jupiter and Saturn. For this reason, scientists often classify Uranus and Neptune as ice giants to distinguish them from the gas giants. Uranus's atmosphere is similar to Jupiter's and Saturn's in its primary composition of hydrogen and helium, but it contains more ices such as water, ammonia, and methane, along with traces of other hydrocarbons. It is the coldest planetary atmosphere in the Solar System, with a minimum temperature of 49 K (−224.2 °C), and has a complex, layered cloud structure with water thought to make up the lowest clouds and methane the uppermost layer of clouds. The interior of Uranus is mainly composed of ices and rock.";
    uranus.imageFile = @"uranus.jpg";
    
    Planets* neptune = [Planets new];
    neptune.name = @"Neptune";
    neptune.planetNum = @"8th planet from the sun.";
    neptune.info = @"Neptune is the eighth and farthest known planet from the Sun in the Solar System. It is the fourth-largest planet by diameter and the third-largest by mass. Among the giant planets in the Solar System, Neptune is the most dense. Neptune is 17 times the mass of Earth and is slightly more massive than its near-twin Uranus, which is 15 times the mass of Earth and slightly larger than Neptune. Neptune orbits the Sun once every 164.8 years at an average distance of 30.1 astronomical units (4.50×109 km). Named after the Roman god of the sea, its astronomical symbol is ♆, a stylised version of the god Neptune's trident.";
    neptune.imageFile = @"neptune.jpg";
    
    // add planet objects to main array
    planetsArray = [NSArray arrayWithObjects:mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// fill cell data
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* planetTableID = @"PlanetCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:planetTableID];
    
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:planetTableID];
    
    // get the planet selected
    Planets *planet = [planetsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.name;
    cell.imageView.image = [UIImage imageNamed:planet.imageFile];
    
    return cell;
}

// return planet array size for table
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [planetsArray count];
}

// segway method
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showPlanetDetail"]) {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController* destViewController = segue.destinationViewController;
        destViewController.planet = [planetsArray objectAtIndex:indexPath.row];
    }
}
@end
