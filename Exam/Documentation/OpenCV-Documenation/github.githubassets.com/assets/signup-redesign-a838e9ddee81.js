"use strict";(globalThis.webpackChunk=globalThis.webpackChunk||[]).push([["signup-redesign"],{59753:(e,t,n)=>{function r(){if(!(this instanceof r))return new r;this.size=0,this.uid=0,this.selectors=[],this.selectorObjects={},this.indexes=Object.create(this.indexes),this.activeIndexes=[]}n.d(t,{f:()=>_,S:()=>A,on:()=>x});var i,o=window.document.documentElement,a=o.matches||o.webkitMatchesSelector||o.mozMatchesSelector||o.oMatchesSelector||o.msMatchesSelector;r.prototype.matchesSelector=function(e,t){return a.call(e,t)},r.prototype.querySelectorAll=function(e,t){return t.querySelectorAll(e)},r.prototype.indexes=[];var s=/^#((?:[\w\u00c0-\uFFFF\-]|\\.)+)/g;r.prototype.indexes.push({name:"ID",selector:function(e){var t;if(t=e.match(s))return t[0].slice(1)},element:function(e){if(e.id)return[e.id]}});var c=/^\.((?:[\w\u00c0-\uFFFF\-]|\\.)+)/g;r.prototype.indexes.push({name:"CLASS",selector:function(e){var t;if(t=e.match(c))return t[0].slice(1)},element:function(e){var t=e.className;if(t){if("string"==typeof t)return t.split(/\s/);if("object"==typeof t&&"baseVal"in t)return t.baseVal.split(/\s/)}}});var u=/^((?:[\w\u00c0-\uFFFF\-]|\\.)+)/g;r.prototype.indexes.push({name:"TAG",selector:function(e){var t;if(t=e.match(u))return t[0].toUpperCase()},element:function(e){return[e.nodeName.toUpperCase()]}}),r.prototype.indexes.default={name:"UNIVERSAL",selector:function(){return!0},element:function(){return[!0]}},i="function"==typeof window.Map?window.Map:function(){function e(){this.map={}}return e.prototype.get=function(e){return this.map[e+" "]},e.prototype.set=function(e,t){this.map[e+" "]=t},e}();var l=/((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^\[\]]*\]|['"][^'"]*['"]|[^\[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g;function d(e,t){var n,r,i,o,a,s,c=(e=e.slice(0).concat(e.default)).length,u=t,d=[];do if(l.exec(""),(i=l.exec(u))&&(u=i[3],i[2]||!u)){for(n=0;n<c;n++)if(a=(s=e[n]).selector(i[1])){for(r=d.length,o=!1;r--;)if(d[r].index===s&&d[r].key===a){o=!0;break}o||d.push({index:s,key:a});break}}while(i)return d}function f(e,t){var n,r,i;for(n=0,r=e.length;n<r;n++)if(i=e[n],t.isPrototypeOf(i))return i}function p(e,t){return e.id-t.id}r.prototype.logDefaultIndexUsed=function(){},r.prototype.add=function(e,t){var n,r,o,a,s,c,u,l,p=this.activeIndexes,m=this.selectors,h=this.selectorObjects;if("string"==typeof e){for(r=0,h[(n={id:this.uid++,selector:e,data:t}).id]=n,u=d(this.indexes,e);r<u.length;r++)a=(l=u[r]).key,(s=f(p,o=l.index))||((s=Object.create(o)).map=new i,p.push(s)),o===this.indexes.default&&this.logDefaultIndexUsed(n),(c=s.map.get(a))||(c=[],s.map.set(a,c)),c.push(n);this.size++,m.push(e)}},r.prototype.remove=function(e,t){if("string"==typeof e){var n,r,i,o,a,s,c,u,l=this.activeIndexes,f=this.selectors=[],p=this.selectorObjects,m={},h=1==arguments.length;for(i=0,n=d(this.indexes,e);i<n.length;i++)for(r=n[i],o=l.length;o--;)if(s=l[o],r.index.isPrototypeOf(s)){if(c=s.map.get(r.key))for(a=c.length;a--;)(u=c[a]).selector===e&&(h||u.data===t)&&(c.splice(a,1),m[u.id]=!0);break}for(i in m)delete p[i],this.size--;for(i in p)f.push(p[i].selector)}},r.prototype.queryAll=function(e){if(!this.selectors.length)return[];var t,n,r,i,o,a,s,c,u={},l=[],d=this.querySelectorAll(this.selectors.join(", "),e);for(t=0,r=d.length;t<r;t++)for(n=0,o=d[t],i=(a=this.matches(o)).length;n<i;n++)u[(c=a[n]).id]?s=u[c.id]:(s={id:c.id,selector:c.selector,data:c.data,elements:[]},u[c.id]=s,l.push(s)),s.elements.push(o);return l.sort(p)},r.prototype.matches=function(e){if(!e)return[];var t,n,r,i,o,a,s,c,u,l,d,f=this.activeIndexes,m={},h=[];for(t=0,i=f.length;t<i;t++)if(c=(s=f[t]).element(e)){for(n=0,o=c.length;n<o;n++)if(u=s.map.get(c[n]))for(r=0,a=u.length;r<a;r++)!m[d=(l=u[r]).id]&&this.matchesSelector(e,l.selector)&&(m[d]=!0,h.push(l))}return h.sort(p)};var m={},h={},v=new WeakMap,g=new WeakMap,y=new WeakMap,b=Object.getOwnPropertyDescriptor(Event.prototype,"currentTarget");function w(e,t,n){var r=e[t];return e[t]=function(){return n.apply(e,arguments),r.apply(e,arguments)},e}function q(e,t,n){var r=[],i=t;do{if(1!==i.nodeType)break;var o=e.matches(i);if(o.length){var a={node:i,observers:o};n?r.unshift(a):r.push(a)}}while(i=i.parentElement)return r}function j(){v.set(this,!0)}function E(){v.set(this,!0),g.set(this,!0)}function S(){return y.get(this)||null}function k(e,t){b&&Object.defineProperty(e,"currentTarget",{configurable:!0,enumerable:!0,get:t||b.get})}function L(e){try{return e.eventPhase,!0}catch(e){return!1}}function T(e){if(L(e)){var t=(1===e.eventPhase?h:m)[e.type];if(t){var n=q(t,e.target,1===e.eventPhase);if(n.length){w(e,"stopPropagation",j),w(e,"stopImmediatePropagation",E),k(e,S);for(var r=0,i=n.length;r<i&&!v.get(e);r++){var o=n[r];y.set(e,o.node);for(var a=0,s=o.observers.length;a<s&&!g.get(e);a++)o.observers[a].data.call(o.node,e)}y.delete(e),k(e)}}}}function x(e,t,n){var i=arguments.length>3&&void 0!==arguments[3]?arguments[3]:{},o=!!i.capture,a=o?h:m,s=a[e];s||(s=new r,a[e]=s,document.addEventListener(e,T,o)),s.add(t,n)}function A(e,t,n){var r=arguments.length>3&&void 0!==arguments[3]?arguments[3]:{},i=!!r.capture,o=i?h:m,a=o[e];a&&(a.remove(t,n),a.size||(delete o[e],document.removeEventListener(e,T,i)))}function _(e,t,n){return e.dispatchEvent(new CustomEvent(t,{bubbles:!0,cancelable:!0,detail:n}))}},81775:(e,t,n)=>{n.d(t,{G:()=>u});var r=n(254),i=n(36071),o=n(59753);function a(e){let t=e.getAttribute("data-required-value"),n=e.getAttribute("data-required-value-prefix");if(e.value===t)e.setCustomValidity("");else{let r=t;n&&(r=n+r),e.setCustomValidity(r)}}(0,r.q6)("[data-required-value]",function(e){let t=e.currentTarget;a(t)}),(0,o.on)("change","[data-required-value]",function(e){let t=e.currentTarget;a(t),u(t.form)}),(0,r.q6)("[data-required-trimmed]",function(e){let t=e.currentTarget;""===t.value.trim()?t.setCustomValidity(t.getAttribute("data-required-trimmed")):t.setCustomValidity("")}),(0,o.on)("change","[data-required-trimmed]",function(e){let t=e.currentTarget;""===t.value.trim()?t.setCustomValidity(t.getAttribute("data-required-trimmed")):t.setCustomValidity(""),u(t.form)}),(0,r.ZG)("input[pattern],input[required],textarea[required],input[data-required-change],textarea[data-required-change],input[data-required-value],textarea[data-required-value]",e=>{let t=e.checkValidity();function n(){let n=e.checkValidity();n!==t&&e.form&&u(e.form),t=n}e.addEventListener("input",n),e.addEventListener("blur",function t(){e.removeEventListener("input",n),e.removeEventListener("blur",t)})});let s=new WeakMap;function c(e){s.get(e)||(e.addEventListener("change",()=>u(e)),s.set(e,!0))}function u(e){let t=e.checkValidity();for(let n of e.querySelectorAll("button[data-disable-invalid]"))n.disabled=!t}(0,i.N7)("button[data-disable-invalid]",{constructor:HTMLButtonElement,initialize(e){let t=e.form;t&&(c(t),e.disabled=!t.checkValidity())}}),(0,i.N7)("input[data-required-change], textarea[data-required-change]",function(e){let t="radio"===e.type&&e.form?e.form.elements.namedItem(e.name).value:null;function n(n){let r=e.form;if(n&&"radio"===e.type&&r&&t)for(let n of r.elements.namedItem(e.name))n instanceof HTMLInputElement&&n.setCustomValidity(e.value===t?"unchanged":"");else e.setCustomValidity(e.value===(t||e.defaultValue)?"unchanged":"")}e.addEventListener("input",n),e.addEventListener("change",n),n(),e.form&&u(e.form)}),document.addEventListener("reset",function(e){if(e.target instanceof HTMLFormElement){let t=e.target;setTimeout(()=>u(t))}})},254:(e,t,n)=>{n.d(t,{ZG:()=>s,q6:()=>u,w4:()=>c});var r=n(8439);let i=!1,o=new r.Z;function a(e){let t=e.target;if(t instanceof HTMLElement&&t.nodeType!==Node.DOCUMENT_NODE)for(let e of o.matches(t))e.data.call(null,t)}function s(e,t){i||(i=!0,document.addEventListener("focus",a,!0)),o.add(e,t),document.activeElement instanceof HTMLElement&&document.activeElement.matches(e)&&t(document.activeElement)}function c(e,t,n){function r(t){let i=t.currentTarget;i&&(i.removeEventListener(e,n),i.removeEventListener("blur",r))}s(t,function(t){t.addEventListener(e,n),t.addEventListener("blur",r)})}function u(e,t){function n(e){let{currentTarget:r}=e;r&&(r.removeEventListener("input",t),r.removeEventListener("blur",n))}s(e,function(e){e.addEventListener("input",t),e.addEventListener("blur",n)})}},35653:(e,t,n)=>{let r;var i=n(36071),o=n(59753),a=n(254),s=n(81775);function c(e,t,n){let r=e.closest(".js-continue-step-container"),i=r.querySelector(".js-continue-button"),o=e.closest(".js-continue-container"),a=o.querySelector(".js-continue-hint-container"),s=a.querySelector(`[data-hint-for="${e.id}"`);i.disabled=!t,s.innerHTML=n}function u(e){let t=e.closest(".js-continue-step-container"),n=t.querySelector(".js-continue-button"),r=e.closest(".js-continue-container"),i=r.querySelector(".js-continue-hint-container"),o=i.querySelector(`[data-hint-for="${e.id}"`);e.required&&(n.disabled=!0),o&&(o.textContent="")}(0,o.on)("typing:complete",".js-signup-typed-welcome",function(e){let t=e.target;t.click()}),(0,o.on)("click","[data-continue-to]",function({currentTarget:e}){let t=document.getElementById(e.getAttribute("data-continue-to")||"");t.hidden=!1,setTimeout(()=>{t.querySelector(".js-continue-focus-target").focus()},0)}),(0,o.on)("focusin",".js-continue-focus-target",function({currentTarget:e}){let t=e.closest(".js-continue-step-container"),n=e.closest(".js-continue-container"),r=n.querySelectorAll(".js-continue-step-container");for(let e of r)if(e===t)e.setAttribute("data-step-state","active");else{let t=e.querySelector(".js-continue-input");t&&!t.checkValidity()?e.setAttribute("data-step-state","invalid"):e.setAttribute("data-step-state","complete")}let i=t.querySelector(".js-continue-input"),o=n.querySelector(".js-continue-hint-container"),a=o.querySelectorAll("[data-hint-for]");for(let e of(i&&i.value.trim()&&i.dispatchEvent(new Event("input")),a))i&&i.id===e.getAttribute("data-hint-for")?(e.hidden=!1,!i.value.trim()&&i.required&&u(i)):e.hidden=!0}),(0,a.w4)("keydown",".js-continue-focus-target",function(e){let t=e.currentTarget,n=t.closest(".js-continue-step-container"),r=n.querySelector(".js-continue-button"),i=t.closest(".js-continue-container"),o=Array.from(i.querySelectorAll(".js-continue-step-container")),a=o[o.indexOf(n)-1];switch(e.key){case"Enter":"submit"!==t.getAttribute("type")&&e.preventDefault(),r?.click();break;case"ArrowDown":r?.click();break;case"ArrowUp":a?.querySelector(".js-continue-focus-target")?.focus()}}),(0,o.on)("focusout",".signup-input",e=>{let t=e.currentTarget;t.value=t.value.trim()}),(0,o.on)("auto-check-success",".js-continue-input",async function(e){let t=e.currentTarget,n=await e.detail.response.text();c(t,!0,n),(0,s.G)(t.form)}),(0,o.on)("auto-check-error",".js-continue-input",async function(e){let t=e.currentTarget,n=await e.detail.response.text();c(t,!1,n),(0,s.G)(t.form)}),(0,a.w4)("keyup",".js-continue-input",function(e){let t=e.currentTarget;!t.value.trim()&&t.required&&u(t)}),(0,i.N7)("#captcha-and-submit-container",function(e){setTimeout(()=>{e instanceof HTMLElement&&(e.style.position="relative",e.hidden=!0,e.style.top="0")},8e3)});let l=()=>{let e=navigator.connection;return e?.effectiveType.match(/2g/)};l()||(async()=>{let{stageSetup:e}=await Promise.all([n.e("vendors-node_modules_three_build_three_module_js"),n.e("app_assets_modules_github_webgl-warp_ts")]).then(n.bind(n,71047));await new Promise(e=>{requestAnimationFrame(e)}),r=e();let t=document.querySelector(".js-signup-warp-vid video");t&&t.setAttribute("preload","auto"),await new Promise(e=>{requestAnimationFrame(e)}),r&&r.init()})();let d=()=>{let e=document.querySelector(".js-signup-warp-bg"),t=document.querySelector(".js-signup-warp-vid"),n=document.querySelector(".js-signup-warp-vid video"),i=document.getElementById("video-desc"),o=document.querySelector(".js-fallback-img"),a=document.querySelectorAll(".js-warp-hide");for(let e=0;e<a.length;e++){let t=a[e];t?.classList.add("warp-hide")}let s=!r||window.matchMedia("(prefers-reduced-motion: reduce)").matches||l();e.removeAttribute("hidden"),i.removeAttribute("style"),s?(n.remove(),o?.removeAttribute("hidden"),e?.classList.add("skipwarp"),t?.classList.add("skipwarp"),setTimeout(()=>window.location.replace("/"),4e3)):(r.hyperStart(),e.classList.add("postwarp"),t.classList.add("postwarp"),setTimeout(()=>r.hyperStop(),2e3),setTimeout(()=>n.play(),2500),setTimeout(()=>window.location.replace("/"),6e3))};(0,o.on)("launch-code-success","launch-code",()=>{if(window.location.search){let e=new URLSearchParams(window.location.search).get("return_to");if(e)try{let t=new URL(e,window.location.origin);if(t.pathname.startsWith("/github-copilot")){window.location.replace(t.pathname+t.search);return}}catch{}}d()}),(0,o.on)("click","[data-launch-animation]",e=>{e.preventDefault(),window.scrollTo(0,0),d()})}},e=>{var t=t=>e(e.s=t);e.O(0,["vendors-node_modules_github_selector-observer_dist_index_esm_js"],()=>t(35653));var n=e.O()}]);
//# sourceMappingURL=signup-redesign-c55f662e65ee.js.map