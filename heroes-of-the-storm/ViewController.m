//
//  ViewController.m
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController ()

@end

@implementation ViewController {
     NSArray* heroArray;
}

@synthesize collectionView = _collectionView;

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* heroID = @"HeroCell";
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:heroID forIndexPath:indexPath];
    
    Hero* hero = [heroArray objectAtIndex:indexPath.row];
    
    UIImageView *heroImageView = (UIImageView *)[cell viewWithTag:50];
    heroImageView.image = [UIImage imageNamed:hero.imageFile];
    
    return cell;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [heroArray count];
}

// segway method
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showHeroDetail"]) {
        
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        DetailViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        destViewController.hero = [heroArray objectAtIndex:indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Hero* abathur = [Hero new];
    abathur.name = @"Abathur";
    abathur.winRate = @"47.5 %";
    abathur.imageFile = @"abathur.jpg";
    abathur.type = @"Specialist";
    abathur.info = @"Abathur, the Evolution Master of Kerrigan's Swarm, works ceaselessly to improve the Zerg from the genetic level up. His hate for chaos and imperfection almost rivals his hatred of pronouns.";
    
    Hero* sonya = [Hero new];
    sonya.imageFile = @"sonya.jpg";
    sonya.name = @"Sonya";
    sonya.winRate = @"54.5%";
    sonya.type = @"Warrior";
    sonya.price = @"$9.99";
    sonya.hp = @"2341";
    sonya.hpRegen = @"4.879";
    sonya.mana = @"100";
    sonya.manaRegen = @"0";
    sonya.range = @"Melee";
    sonya.ats = @"1.25";
    sonya.damage = @"88";
    sonya.maxhp = @"+4";
    sonya.regenper = @"+0";
    sonya.damageper = @"+4";
    sonya.type = @"Warrior";
    sonya.imgtrait = @"sonyaTrait.png";
    sonya.imgab1 = @"sonyaab1.png";
    sonya.imgab2 = @"sonyaab2.png";
    sonya.imgab3 = @"sonyaab3.png";
    sonya.imgult1 = @"sonyault1.png";
    sonya.imgult2 = @"sonyault2.png";
    sonya.info = @"From the frozen Dreadlands of the north come the mighty Barbarian warriors. After surviving the destruction of her home and death of her tribe, Sonya wanders Sanctuary in search of battle and a better life for her people.";
    sonya.talentsArray = [NSArray arrayWithObjects: @"Endless Fury", @"War Paint", @"Shot of Fury", @"Block", @"Hurricane", @"Shattered Ground", @"Mercenary Lord", @"Focused Attacked", @"Ferocious Healing", @"Composite Spear", @"Poisoned Spear", @"Follow Through", @"Leap", @"Wrath of the Berserker", @"Mystical Spear", @"Aftershock", @"Life Funnel", @"Spell Shield", @"No Escape", @"Furious Blow", @"Imposing Presence", @"Nerves of Steel", @"Anger Management", @"Arreat Crater", @"Ignore Pain", @"Nexus Blades", nil];
    sonya.trait = @"Fury\nUse Fury instead of Mana, which is gained by taking or dealing damage. Using a Basic or Heroic Ability grants 10% Movement Speed for 4 seconds.";
    sonya.ability1 = @"Ancient Spear\nCooldown: 13 seconds\nThrow out a spear that pulls you to the first enemy hit, dealing 380 (180 + 4% per level) damage and briefly stunning them. If this hits an enemy, generate 40 Fury.";
    sonya.ability2 = @"Seismic Slam\n25 Mana Cooldown: 1 seconds\nDeals 386 (184 + 4% per level) damage to the target enemy, and 97 (46 + 4% per level) to enemies behind the target.";
    sonya.ability3 = @"Whirlwind\n40 Mana Cooldown: 4 seconds\nDeals 875 (415 + 4% per level) damage to nearby enemies over 3 seconds, and heals for 20% of damage dealt. Healing tripled versus Heroes.";
    sonya.ult1 = @"Leap\nCooldown: 70 seconds\nLeap into the air, dealing 296 (141 + 4% per level) damage to nearby enemies, and stunning them for 1.25 seconds.";
    sonya.ult2 = @"Wrath of the Berserker\nCooldown: 60 seconds\nIncrease damage dealt by 40%. Reduce the duration of silences, stuns, slows, roots, and polymorphs against you by 50%. Lasts 15 seconds, and extends by 1 second for every 10 Fury gained.";
    
    Hero* anub = [Hero new];
    anub.name = @"Anub'Arak";
    anub.winRate = @"59.2%";
    anub.type = @"Warrior";
    anub.price = @"$9.99";
    anub.hp = @"800";
    anub.hpRegen = @"1.668";
    anub.mana = @"500";
    anub.manaRegen = @"3";
    anub.range = @"Melee";
    anub.ats = @"1.00";
    anub.damage = @"45";
    anub.maxhp = @"+180";
    anub.regenper = @"+0.375";
    anub.damageper = @"+9";
    anub.imgtrait = @"anubtrait.png";
    anub.imgult1 = @"anubult1.png";
    anub.imgult2 = @"anubult2.png";
    anub.imgab1 = @"anubab1.png";
    anub.imgab2 = @"anubab2.png";
    anub.imgab3 = @"anubab3.png";
    anub.talentsArray = [NSArray arrayWithObjects:@"Extended Spikes", @"Dampen Magic", @"Assault Scarab", @"Regeneration Master", @"Underking", @"Locust Needles", @"Legion of Beetles", @"Shed Exoskeleton", @"Chitinous Plating", @"Leeching Scarabs", @"Locust Swarm", @"Cocoon", @"Burning Rage", @"Utricating Spines", @"Bed of Barbs", @"Epicenter", @"Beetle, Juiced", @"Blood for Blood", @"Hive Master", @"Cryptweave", @"Hardened Shield", @"Rewind", nil];
    anub.info= @"Once a proud nerubian king, Anub'arak dared to stand against the Lich King's invasion, but despite his bravery, he too fell to the unrelenting Scourge. Resurrected into undeath, the Traitor King now serves as a towering, weapon of destruction.";
    anub.imageFile = @"anubarak.jpg";
    anub.ability1 = @"Impale\n65 Mana Cooldown: 12 seconds. \n Deals 220 (104 + 4% per level) damage. Stuns for 1 second.";
    anub.ability2 = @"Harden Carapace\n35 Mana Cooldown: 8 seconds\n Gain a Shield that absorbs 570 (260 + 4% per level) damage over 3 seconds.";
    anub.ability3 = @"Burrow Charge\n65 Mana Cooldown: 16 seconds \n Burrows to location, dealing 235 (112 + 4% per level) damage and briefly stunning enemies in a small area upon surfacing. Can reactivate the Ability to surface early.";
    anub.ult1 = @"Locust Swarm\n100 Mana Cooldown: 100 seconds\n Deal 145 (69 + 4% per level) damage per second in an area around yourself. Each enemy damaged heals you for 40 (19 + 4% per level) Health. Lasts 8 seconds.";
    anub.ult2 = @"Cocoon\n70 Mana Cooldown: 60 seconds\n Wraps target enemy Hero in a cocoon, rendering them unable to act or be targeted for 8 seconds. Allies of the Hero can attack the cocoon to break it and free them early.";
    anub.trait = @"Scarab Host\nSpawn a Beetle at your location whenever you use an ability. Beetles last for 8 seconds, attacking nearby enemies for 44 (21 + 4% per level) damage.";
    
    
    Hero* artanis = [Hero new];
    artanis.name = @"Artanis";
    artanis.imageFile = @"artanis.jpg";
    
    Hero* arthas = [Hero new];
    arthas.name = @"Arthas";
    arthas.imageFile = @"arthas.jpg";
    
    Hero* azmo = [Hero new];
    azmo.name = @"Azmodan";
    azmo.imageFile = @"azmodan.jpg";
    
    Hero* bw = [Hero new];
    bw.name = @"Brightwing";
    bw.imageFile = @"brightwing.jpg";
    
    Hero* chen = [Hero new];
    chen.name = @"Chen";
    chen.imageFile = @"chen.jpg";
    
    Hero* cho = [Hero new];
    cho.name = @"Cho";
    cho.imageFile = @"chogall.jpg";
    
    Hero* chrom = [Hero new];
    chrom.name = @"Chromie";
    chrom.imageFile = @"chromie.jpg";
    
    Hero* dehaka = [Hero new];
    dehaka.name = @"Dehaka";
    dehaka.imageFile = @"dehaka.jpg";
    
    Hero* diablo = [Hero new];
    diablo.name = @"Diablo";
    diablo.imageFile = @"diablo.jpg";
    
    Hero* etc = [Hero new];
    etc.imageFile = @"etc.jpg";
    
    Hero* falstad = [Hero new];
    falstad.imageFile = @"falstad.jpg";
    
    Hero* gaz = [Hero new];
    gaz.imageFile = @"gazlowe.jpg";
    
    Hero* grey = [Hero new];
    grey.imageFile = @"greymane.jpg";
    
    Hero* guldan = [Hero new];
    guldan.imageFile = @"guldan.jpg";
    
    Hero* ill = [Hero new];
    ill.imageFile = @"illidan.jpg";
    
    Hero* jaina = [Hero new];
    jaina.imageFile = @"jaina.jpg";
    
    Hero* joh = [Hero new];
    joh.imageFile = @"johanna.jpg";
    
    Hero* kael = [Hero new];
    kael.imageFile = @"kaelthas.jpg";
    
    Hero* kerr = [Hero new];
    kerr.imageFile = @"kerrigan.jpg";
    
    Hero* khar = [Hero new];
    khar.imageFile = @"kharazim.jpg";
    
    Hero* leo = [Hero new];
    leo.imageFile = @"leoric.jpg";
    
    Hero* lili = [Hero new];
    lili.imageFile = @"lili.jpg";
    
    Hero* ming = [Hero new];
    ming.imageFile = @"li-ming.jpg";
    
    Hero* lt = [Hero new];
    lt.imageFile = @"lt-morales.jpg";
    
    Hero* lunara = [Hero new];
    lunara.imageFile = @"lunara.jpg";
    
    Hero* malf = [Hero new];
    malf.imageFile = @"malfurion.jpg";
    
    Hero* med = [Hero new];
    med.imageFile = @"medivh.jpg";
    
    Hero* mura = [Hero new];
    mura.imageFile = @"muradin.jpg";
    
    Hero* murky = [Hero new];
    murky.imageFile = @"murky.jpg";
    
    Hero* naz = [Hero new];
    naz.imageFile = @"nazeebo.jpg";
    
    Hero* nova = [Hero new];
    nova.imageFile = @"nova.jpg";
    
    Hero* ray = [Hero new];
    ray.imageFile = @"raynor.jpg";
    
    Hero* reh = [Hero new];
    reh.imageFile = @"rehgar.jpg";
    
    Hero* rex = [Hero new];
    rex.imageFile = @"rexxar.jpg";
    
    Hero* sgt = [Hero new];
    sgt.imageFile = @"sgt-hammer.jpg";
    
    Hero* stitches = [Hero new];
    stitches.imageFile = @"stitches.jpg";
    
    Hero* syl = [Hero new];
    syl.imageFile = @"sylvanas.jpg";
    
    Hero* tass = [Hero new];
    tass.imageFile = @"tassadar.jpg";
    
    Hero* butch = [Hero new];
    butch.imageFile = @"the-butcher.jpg";
    
    Hero* tlv = [Hero new];
    tlv.imageFile = @"the-lost-vikings.jpg";
    
    Hero* thrall = [Hero new];
    thrall.imageFile = @"thrall.jpg";
    
    Hero* tracer = [Hero new];
    tracer.imageFile = @"tracer.jpg";
    
    Hero* tychus = [Hero new];
    tychus.imageFile = @"tychus.jpg";
    
    Hero* tyra = [Hero new];
    tyra.imageFile = @"tyrael.jpg";
    
    Hero* tyr = [Hero new];
    tyr.imageFile = @"tyrande.jpg";
    
    Hero* uther = [Hero new];
    uther.imageFile = @"uther.jpg";
    
    Hero* valla = [Hero new];
    valla.imageFile = @"valla.jpg";
    
    Hero* xul = [Hero new];
    xul.imageFile = @"xul.jpg";
    
    Hero* zag = [Hero new];
    zag.imageFile = @"zagara.jpg";
    
    Hero* zera = [Hero new];
    zera.imageFile = @"zeratul.jpg";
    
    heroArray = [NSArray arrayWithObjects:abathur, anub, artanis, arthas, azmo, bw, chen, cho, chrom, dehaka, diablo, etc, falstad, gaz, grey, guldan, ill, jaina, joh, kael, kerr, khar, leo, lili, lt, lunara , malf, med, mura, murky, naz, nova, ray, reh, rex, sgt, sonya, stitches, syl, tass, butch, tlv, thrall, tracer, tychus, tyra, tyr, uther, valla, xul, zag, zera, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
