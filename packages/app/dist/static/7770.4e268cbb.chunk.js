"use strict";(()=>{(self.webpackChunkapp=self.webpackChunkapp||[]).push([[7770],{47770:function(P,O,m){m.r(O);var n=m(26312),W=m(7699),y=m(2784),H=m(28316),_=Object.defineProperty,u=(e,t)=>_(e,"name",{value:t,configurable:!0});n.C.defineOption("info",!1,(e,t,i)=>{if(i&&i!==n.C.Init){const o=e.state.info.onMouseOver;n.C.off(e.getWrapperElement(),"mouseover",o),clearTimeout(e.state.info.hoverTimeout),delete e.state.info}if(t){const o=e.state.info=v(t);o.onMouseOver=C.bind(null,e),n.C.on(e.getWrapperElement(),"mouseover",o.onMouseOver)}});function v(e){return{options:e instanceof Function?{render:e}:e===!0?{}:e}}u(v,"createState");function h(e){const t=e.state.info.options;return(t==null?void 0:t.hoverTime)||500}u(h,"getHoverTime");function C(e,t){const i=e.state.info,o=t.target||t.srcElement;if(!(o instanceof HTMLElement)||o.nodeName!=="SPAN"||i.hoverTimeout!==void 0)return;const s=o.getBoundingClientRect(),r=u(function(){clearTimeout(i.hoverTimeout),i.hoverTimeout=setTimeout(a,f)},"onMouseMove"),p=u(function(){n.C.off(document,"mousemove",r),n.C.off(e.getWrapperElement(),"mouseout",p),clearTimeout(i.hoverTimeout),i.hoverTimeout=void 0},"onMouseOut"),a=u(function(){n.C.off(document,"mousemove",r),n.C.off(e.getWrapperElement(),"mouseout",p),i.hoverTimeout=void 0,g(e,s)},"onHover"),f=h(e);i.hoverTimeout=setTimeout(a,f),n.C.on(document,"mousemove",r),n.C.on(e.getWrapperElement(),"mouseout",p)}u(C,"onMouseOver");function g(e,t){const i=e.coordsChar({left:(t.left+t.right)/2,top:(t.top+t.bottom)/2}),s=e.state.info.options,r=s.render||e.getHelper(i,"info");if(r){const p=e.getTokenAt(i,!0);if(p){const a=r(p,s,e,i);a&&M(e,t,a)}}}u(g,"onMouseHover");function M(e,t,i){const o=document.createElement("div");o.className="CodeMirror-info",o.appendChild(i),document.body.appendChild(o);const s=o.getBoundingClientRect(),r=window.getComputedStyle(o),p=s.right-s.left+parseFloat(r.marginLeft)+parseFloat(r.marginRight),a=s.bottom-s.top+parseFloat(r.marginTop)+parseFloat(r.marginBottom);let f=t.bottom;a>window.innerHeight-t.bottom-15&&t.top>window.innerHeight-t.bottom&&(f=t.top-a),f<0&&(f=t.bottom);let d=Math.max(0,window.innerWidth-p-15);d>t.left&&(d=t.left),o.style.opacity="1",o.style.top=f+"px",o.style.left=d+"px";let c;const T=u(function(){clearTimeout(c)},"onMouseOverPopup"),l=u(function(){clearTimeout(c),c=setTimeout(E,200)},"onMouseOut"),E=u(function(){n.C.off(o,"mouseover",T),n.C.off(o,"mouseout",l),n.C.off(e.getWrapperElement(),"mouseout",l),o.style.opacity?(o.style.opacity="0",setTimeout(()=>{o.parentNode&&o.parentNode.removeChild(o)},600)):o.parentNode&&o.parentNode.removeChild(o)},"hidePopup");n.C.on(o,"mouseover",T),n.C.on(o,"mouseout",l),n.C.on(e.getWrapperElement(),"mouseout",l)}u(M,"showPopup")}}]);})();

//# sourceMappingURL=7770.4e268cbb.chunk.js.map