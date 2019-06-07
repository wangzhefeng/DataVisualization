/**
 * 
 * @authors zfwang (wangzhefengr@163.com)
 * @date    2017-08-07 21:08:35
 * @version $Id$
 */


myChart.setOption({
	title: {
		show: true,
		
		// 主标题，支持使用\n换行
		text: '',
		//link: '',
		//target: 'self'|'blank', 
		textStyle: {
			color: ,
			fontStyle: ,
			fontWeight: ,
			fontFamily: ,
			fontSize:
		},
		textAlign: 'left'|'center'|'right',
		//textBaseline: 'top'|'middle'|'bottom',
		
		// 副标题，支持使用\n换行
		subtext: '',
		//sublink: '',
		//subtarget: 'self'|'blank',
		subtextStyle: {
			color: ,
			fontStyle: ,
			fontWeight: ,
			fontFamily: ,
			fontSize:
		},

		// 位置信息
		padding: [, , , ],
		itemGap: ,
		alevel: ,
		z: ,
		top: ,
		right: ,
		bottom: ,
		left: ,
		// 背景
		backgroundColor: 'transparent',
		// 边框
		borderColor: ,
		borderWidth: ,
		// 阴影
		shadowBlur: ,
		shadowColor: ,
		shadowOffsetX: ,
		shadowOffsetY: ,
	},                  // 标题 
	legend: {
		show: ,
		// 位置信息
		zlevel: ,
		z: ,
		top: ,
		right: ,
		bottom: ,
		left: ,
		width: 'auto',
		height: 'auto',
		orient: 'horizontal'|'vertical',
		align: 'auto',
		padding: [, , , ],
		itemGap: ,
		itemWidth: ,
		itemHeight: ,
		// 样式信息
		formatter: ,
		selectMode: ,
		inactiveColor: ,
		selected: ,
		textStyle: {
			color: ,
			fontStyle: ,
			fontWeight: ,
			fontFamily: ,
			fontSize: 
		},
		tooptip: {
			show: true
		},
		backgroundColor: ,
		borderColor: ,
		borderWidth: ,
		shadowBlur: ,
		shadowColor: ,
		shadowOffsetX: ,
		shadowOffsetY: ,
	},                  // 图例
	color: {},          // 调色盘颜色列表
	backgroundColor: {},// 全局背景颜色
	textStyle: {
		color: ,
		fontStyle: ,
		fontWeight ,
		fontFamily: ,
		fontSize: ,
	},					// 全局的字体样式
/*===============  坐标系 =============== */
	xAxis: {},          // 直角坐标系x轴
	yAxis: {},          // 直角坐标系y轴
	grid: {},           // 直角坐标系内绘图网格
	polar: {},          // 极坐标系
	radiusAxis: {},		// 极坐标系的径向轴
	angleAxis: {},		// 极坐标系的角度轴
	calendar: {},		// 日历坐标系
	radar: {},			// 雷达坐标系
	geo: {},			// 地图坐标系
	parallel: {},		// 平行坐标系
	parallelAxis: {},	// 平行坐标系的坐标轴
	singleAxis: {},		// 单轴
/*===============常用工具==================*/
	dataZoom: [         // 数据区域缩放
		{
			type: 'inside',
			disabled: false,
			xAxisIndex: null,
			yAxisIndex: null,
			radiusAxisIndex: null,
			angleAxisIndex: null,
			filterMode: 'filter',
			start: 0,
			end: 100,
			startValue: null,
			endValue: null,
			minSpan: null,
			maxSpan: null,
			minValueSpan: null,
			maxValueSpan: null,
			orient: null,
			zoomLock: false,
			throttle: 100,
			zoomOnMouseWheel: true,
			moveOnMouseMove: true,
			preventDefaultMouseMove: true
		},
		{
			type: 'slider',
			show: true,
			backgroundColor: '',
			dataBackground: {},
			filterColor: ,
			borderColor: ,
			handleIcon: ,
			handleSize: ,
			handleStyle: ,
			labelPrecision: ,
			labelFormatter: ,
			showDetail: ,
			showDataShadow: ,
			realtime: ,
			textStyle: {},
			xAxisIndex: ,
			yAxisIndex: ,
			radiusAxisIndex: 'null',
			angleAxisIndex: 'null',
			filterMode: 'filter',
			start: 0,
			end: 100,
			startValue: null,
			endValue: null,
			minSpan: null,
			maxSpan: null,
			minValueSpan: null,
			maxValueSpan: null,
			orient: null,
			zoomLock: false,
			throttle: 100,
			zlevel: 0,
			z: 2,
			left: 'auto',
			top: 'auto',
			right: 'auto',
			bottom: 'auto',
		}
	],
	visualMap: {},		// 视觉映射组件
	tooltip: {},		// 提示框组件
	toolbox: {},		// 工具栏
	axisPointer: {},
	brush: {},
	timeline: {},
	graphic: {},		// 原生图形元素组件
	series: [			// 系列列表
		{
			type: 'line',
			name: ,
			coordinateSystem: ,
			xAxisIndex: ,
			yAxisIndex: ,
			polarIndex: ,
			symbol: ,
			symbolSize: ,
			symbolRotate: ,
			sysbolOffset: [],
			showSymbol: ,
			showAllSymbol: ,
			hoverAmimation: ,
			legendHoverLink: ,
			stack: ,
			cursor: ,
			connectNulls: ,
			clipOverflow: ,
			step: false,
			label: {

			},
			itemStyle: {

			},
			lineStyle: {

			},
			areaStyle: {

			},
			data: [{

			}],
			markPoint: {

			},
			markLine: {

			},
			markArea: {

			},
			z: 2,
			silent: false,
			animation: true,
			animationThreshold: 2000,
			animationDuration: 1000,
			animationEasing: linear,
			animationDelay: 0,
			animationDurationUpdate: 300,
			animationEasingUpdate: ,
			animationDelayUpdate: ,
			tooltip: {},
		},
		{
			type: 'bar',
			name: ,
		},
		{
			type: 'pie',
			name: ,
		},
		{
			type: 'scatter',
			name: ,
		},
		{
			type: 'effectScatter',
			name: ,
		},
		{
			type: 'radar',
			name: ,
		},
		{
			type: 'treemap',
			name: ,
		},
		{
			type: 'boxplot',
			name: ,
		},
		{
			type: 'candlestick',
			name: ,
		},
		{
			type: 'heatmap',
			name: ,
		},
		{
			type: 'map',
			name: ,
		},
		{
			type: 'parallel',
			name: ,
		},
		{
			type: 'lines',
			name: ,
		},
		{
			type: 'graph',
			name: ,
		},
		{
			type: 'sankey',
			name: ,
		},
		{
			type: 'funnel',
			name: ,
		},
		{
			type: 'gauge',
			name: ,
		},
		{
			type: 'pictorialBar',
			name: ,
		},
		{
			type: 'themeRiver',
			name: ,
		},
		{
			type: 'custom',
			name: ,
		}
	],
// -------------动画效果-------------------
	animation: {					// 是否开启动画
		show: true
	},					            //
	animationThreshold: {},			//
	animationDuration: {},			//
	animationEasing: {},			//
	animationDelay: {},				//
	animationDurationUpdate: {},	//
	animationEasingUpdate: {},		//
	animationDelayUpdate: {},		//
// -----------------------------------
	progressive: {},
	progressiveThreshold: {},
	blendMode: {},
	hoveLayerThreshold: {},
	useUTC: {},
});