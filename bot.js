require('dotenv').config();
process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';
const cat = require('nekos.life');
const {
	Client,
	GatewayIntentBits,
	EmbedBuilder,
	ButtonBuilder,
	ButtonStyle,
	ActionRowBuilder,
	ComponentType,
} = require('discord.js');

const neko = new cat();

const client = new Client({
	intents: [
		GatewayIntentBits.Guilds,
		GatewayIntentBits.GuildMembers,
		GatewayIntentBits.GuildMessages,
		GatewayIntentBits.MessageContent,
	],
});

client.on('ready', (c) => {
	console.log(`✅ ${c.user.tag} is online.`);
});

function print(text) {
	console.log(text);
}

client.on('interactionCreate', async (interaction) => {
	if (!interaction.isChatInputCommand()) return;

	if (interaction.commandName === 'ping') {
		interaction.reply('Pong!');
	}

	if (interaction.commandName === 'ship') {
		const user = interaction.options.getUser('user1');
		const user2 = interaction.options.getUser('user2');
		let probability = Math.floor(Math.random()*100);
		if (user.id == "969754059202494534" || user2.id == "969754059202494534") {
			probability = 0;
		};
		const embed = new EmbedBuilder()
			.setTitle(`Shipped ${user.username} and ${user2.username}!`)
			.setDescription(`**<@${user.id}>** and **<@${user2.id}>** are **${probability}%** compatible!`)
			.setColor(0x9A2389);

		interaction.reply({ embeds: [embed] });
	};

	if (interaction.commandName === 'help') {
		const embed = new EmbedBuilder()
			.setTitle('Help')
			.setDescription('This is a list of commands:')
			.addFields(
				{ name: '/ping', value: 'Replies with Pong!' },
				{ name: '/ship', value: 'Ships two users together!' },
				{ name: '/help', value: 'Shows a list of commands' },
				{ name: '/anime', value: 'Generates pictures of anime girls' },
			);

		interaction.reply({embeds: [embed]})
	};

	if (interaction.commandName === 'anime') {
		const type = interaction.options.get('type').value;
		let waifu;

		const pin = new ButtonBuilder()
		.setCustomId("pin")
		.setEmoji("📌")
		.setStyle(ButtonStyle.Secondary);

		const smash = new ButtonBuilder()
		.setCustomId("smash")
		.setLabel("Smash")
		.setStyle(ButtonStyle.Success);

		const pass = new ButtonBuilder()
		.setCustomId("pass")
		.setLabel("Pass")
		.setStyle(ButtonStyle.Danger);

		const child = new ButtonBuilder()
		.setCustomId("child")
		.setLabel("Child")
		.setStyle(ButtonStyle.Danger);

		const row = new ActionRowBuilder()
		.addComponents(pin, smash, pass, child);

		const animegirl = waifucheck(type);

		animegirl.then(async function(result) {
			await interaction.reply({content: result.url, components: [row], fetchReply: true})
			const reply = await interaction.fetchReply();
			createCollector(reply)
		});
	};
	
	if (interaction.commandName === 'femboy') {
	  const search = interaction.options.get('search').value;
	  
	  const res = await axios.get(`https://femboyfinder.firestreaker2.gq/api/${search}`);
	  const embed = new EmbedBuilder()
    .addFields(
	 		{value: res.data.url},
	    {name: "Tags", value: res.data.tags}
	 	);
	      
	  interaction.reply({embeds: [embed]})
	};
});
async function createCollector(reply) {
  const collector = reply.createMessageComponentCollector({componentType: ComponentType.Button, time: 15000});
  
  collector.on('collect', async i => {
  	if (i.customId === "pin") {
  		reply.pin()
  		await i.reply(`Pinned by <@${i.user.id}>`)
  	}
  });
  
  collector.on('collect', async i => {
  	if (i.customId === "child") {
  		await i.reply(`<@${i.user.id}> thinks it's a child`)
  	}
  });
  
  collector.on('collect', async i => {
  	if (i.customId === "pass") {
  		await i.reply(`Passed by <@${i.user.id}>`)
  	}
  });
  
  collector.on('collect', async i => {
  	if (i.customId === "smash") {
  		await i.reply(`<@${i.user.id}> would smash`)
  	}
  });
}
async function waifucheck(type) {
	if (type == "waifu") {
		const waifu = await neko.waifu();
		return waifu;
	}

	if (type == "fox") {
		const waifu = await neko.foxGirl();
		return waifu;
	}

	if (type == "neko") {
		const waifu = await neko.neko();
		return waifu;
	}

	if (type == "smug") {
		const waifu = await neko.smug();
		return waifu;
	}

	if (type == "tickle") {
		const waifu = await neko.tickle();
		return waifu;
	}

	if (type == "slap") {
		const waifu = await neko.slap();
		return waifu;
	}

	if (type == "pat") {
		const waifu = await neko.neko();
		return waifu;
	}

	if (type == "neko_GIF") {
		const waifu = await neko.nekoGif();
		return waifu;
	}

	if (type == "kiss") {
		const waifu = await neko.kiss();
		return waifu;
	}

	if (type == "hug") {
		const waifu = await neko.hug();
		return waifu;
	}

	if (type == "feed") {
		const waifu = await neko.feed();
		return waifu;
	}

	if (type == "cuddle") {
		const waifu = await neko.cuddle();
		return waifu;
	}

	if (type == "woof") {
		const waifu = await neko.woof();
		return waifu;
	}

	if (type == "wallpaper") {
		const waifu = await neko.wallpaper();
		return waifu;
	}

	if (type == "genetic_engineered_cat_girl_tf") {
		const waifu = await neko.gecg();
		return waifu;
	}
}

client.login("OTE5ODQ1Mzc0MjY3NjMzNjg0.GEpivY.NzmWZk3dnmIWstmg6wfF3aSlUiGCvHCxuUm1mE");
