////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package flashx.textLayout.formats
{
	import flashx.textLayout.debug.Debugging
	import flashx.textLayout.debug.assert
	import flashx.textLayout.property.*
	import flashx.textLayout.tlf_internal
	use namespace tlf_internal
	import flash.text.engine.TabAlignment
	/**
	 * The TabStopFormat class represents the properties of a tab stop in a paragraph. You can set the <code>TextLayoutFormat.tabstops</code> property to an array of TabStopFormat objects.
	 * @includeExample examples\TabStopFormat_example.as -noswf
	 * @see flashx.textLayout.elements.TabElement 
	 * @see flashx.textLayout.formats.TextLayoutFormat#tabStops
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @langversion 3.0
	 */
	public class TabStopFormat implements ITabStopFormat
	{
		/** @private */
		static private var _positionProperty:NumberProperty = new NumberProperty("position",0,false,Category.TABSTOP,0,10000); 		/** @private */
		static private var _alignmentProperty:EnumStringProperty = new EnumStringProperty(
			"alignment",flash.text.engine.TabAlignment.START,false,Category.TABSTOP
			,flash.text.engine.TabAlignment.START
			,flash.text.engine.TabAlignment.CENTER
			,flash.text.engine.TabAlignment.END
			,flash.text.engine.TabAlignment.DECIMAL
		);
		/** @private */
		static private var _decimalAlignmentTokenProperty:StringProperty = new StringProperty("decimalAlignmentToken",null,false,Category.TABSTOP);

		/** @private */
		static tlf_internal function get positionProperty():NumberProperty
		{ return _positionProperty; }
		/** @private */
		static tlf_internal function get alignmentProperty():EnumStringProperty
		{ return _alignmentProperty; }
		/** @private */
		static tlf_internal function get decimalAlignmentTokenProperty():StringProperty
		{ return _decimalAlignmentTokenProperty; }

		static private var _description:Object = {
			  position:_positionProperty
			, alignment:_alignmentProperty
			, decimalAlignmentToken:_decimalAlignmentTokenProperty
		}

		/** Property descriptions accessible by name. @private */
		static tlf_internal function get description():Object
		{ return _description; }

		/** @private */
		static private var _emptyTabStopFormat:ITabStopFormat;
		/**
		 * Returns an ITabStopFormat instance with all properties set to <code>undefined</code>.
		 * @private
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		static tlf_internal function get emptyTabStopFormat():ITabStopFormat
		{
			if (_emptyTabStopFormat == null)
				_emptyTabStopFormat = new TabStopFormat();
			return _emptyTabStopFormat;
		}


		private var _position:*;
		private var _alignment:*;
		private var _decimalAlignmentToken:*;

		/**
		 * The position of the tab stop, in pixels, relative to the start of the line.
		 * <p>Legal values are numbers from 0 to 10000 and flashx.textLayout.formats.FormatValue.INHERIT.</p>
		 * <p>Default value is undefined indicating not set.</p>
		 * <p>If undefined during the cascade this property will have a value of 0.</p>
		 * @see FormatValue#INHERIT
		 * 
		 * @throws RangeError when set value is not within range for this property
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function get position():*
		{ return _position; }
		public function set position(newValue:*):void
		{ _position = _positionProperty.setHelper(_position,newValue); }

		/**
		 * The tab alignment for this tab stop. 
		 * <p>Legal values are flash.text.engine.TabAlignment.START, flash.text.engine.TabAlignment.CENTER, flash.text.engine.TabAlignment.END, flash.text.engine.TabAlignment.DECIMAL, flashx.textLayout.formats.FormatValue.INHERIT.</p>
		 * <p>Default value is undefined indicating not set.</p>
		 * <p>If undefined during the cascade this property will have a value of START.</p>
		 * @see FormatValue#INHERIT
		 * 
		 * @throws RangeError when set value is not within range for this property
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 * @see flash.text.engine.TabAlignment
		 */
		public function get alignment():*
		{ return _alignment; }
		public function set alignment(newValue:*):void
		{ _alignment = _alignmentProperty.setHelper(_alignment,newValue); }

		/**
		 * The alignment token to be used if the alignment is DECIMAL.
		 * <p>Default value is undefined indicating not set.</p>
		 * <p>If undefined during the cascade this property will have a value of null.</p>
		 * 
		 * @throws RangeError when set value is not within range for this property
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function get decimalAlignmentToken():*
		{ return _decimalAlignmentToken; }
		public function set decimalAlignmentToken(newValue:*):void
		{ _decimalAlignmentToken = _decimalAlignmentTokenProperty.setHelper(_decimalAlignmentToken,newValue); }

		/**
		 * Creates a new TabStopFormat object. All settings are empty or, optionally, are initialized from the
		 * supplied <code>initialValues</code> object.
		 * 
		 * @param initialValues optional instance from which to copy initial values.
		 * 
		 * @see #defaultFormat
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function TabStopFormat(initialValues:ITabStopFormat = null)
		{
			if (initialValues)
				apply(initialValues)
		}

		/**
		 * Copies TabStopFormat settings from the <code>values</code> ITabStopFormat instance into this TabStopFormat object.
		 * If <code>values</code> is <code>null</code>, this TabStopFormat object is initialized with undefined values for all properties.
		 * @param values optional instance from which to copy values.
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function copy(values:ITabStopFormat):void
		{
			 if (values == null)
				values = emptyTabStopFormat;
			this.position = values.position;
			this.alignment = values.alignment;
			this.decimalAlignmentToken = values.decimalAlignmentToken;
		}

		/**
		 * Concatenates the values of properties in the <code>incoming</code> ITabStopFormat instance
		 * with the values of this TabStopFormat object. In this (the receiving) TabStopFormat object, properties whose values are <code>FormatValue.INHERIT</code>,
		 * and inheriting properties whose values are <code>undefined</code> will get new values from the <code>incoming</code> object.
		 * Non-inheriting properties whose values are <code>undefined</code> will get their default values.
		 * All other property values will remain unmodified.
		 * 
		 * @param incoming instance from which values are concatenated.
		 * @see flashx.textLayout.formats.FormatValue#INHERIT
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function concat(incoming:ITabStopFormat):void
		{
			this.position = _positionProperty.concatHelper(this.position, incoming.position);
			this.alignment = _alignmentProperty.concatHelper(this.alignment, incoming.alignment);
			this.decimalAlignmentToken = _decimalAlignmentTokenProperty.concatHelper(this.decimalAlignmentToken, incoming.decimalAlignmentToken);
		}

		/**
		 * Concatenates the values of properties in the <code>incoming</code> ITabStopFormat instance
		 * with the values of this TabStopFormat object. In this (the receiving) TabStopFormat object, properties whose values are <code>FormatValue.INHERIT</code>,
		 * and inheriting properties whose values are <code>undefined</code> will get new values from the <code>incoming</code> object.
		 * All other property values will remain unmodified.
		 * 
		 * @param incoming instance from which values are concatenated.
		 * @see flashx.textLayout.formats.FormatValue#INHERIT
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function concatInheritOnly(incoming:ITabStopFormat):void
		{
			this.position = _positionProperty.concatInheritOnlyHelper(this.position, incoming.position);
			this.alignment = _alignmentProperty.concatInheritOnlyHelper(this.alignment, incoming.alignment);
			this.decimalAlignmentToken = _decimalAlignmentTokenProperty.concatInheritOnlyHelper(this.decimalAlignmentToken, incoming.decimalAlignmentToken);
		}

		/**
		 * Replaces property values in this TabStopFormat object with the values of properties that are set in
		 * the <code>incoming</code> ITabStopFormat instance. Properties that are <code>undefined</code> in the <code>incoming</code>
		 * ITabStopFormat instance are not changed in this object.
		 * 
		 * @param incoming instance whose property values are applied to this TabStopFormat object.
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function apply(incoming:ITabStopFormat):void
		{
			var val:*;

			if ((val = incoming.position) !== undefined)
				this.position = val;
			if ((val = incoming.alignment) !== undefined)
				this.alignment = val;
			if ((val = incoming.decimalAlignmentToken) !== undefined)
				this.decimalAlignmentToken = val;
		}

		/**
		 * Compares properties in ITabStopFormat instance <code>p1</code> with properties in ITabStopFormat instance <code>p2</code>
		 * and returns <code>true</code> if all properties match.
		 * 
		 * @param p1 instance to compare to <code>p2</code>.
		 * @param p2 instance to compare to <code>p1</code>.
		 * 
		 * @return true if all properties match, false otherwise.
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		static public function isEqual(p1:ITabStopFormat,p2:ITabStopFormat):Boolean
		{
			if (p1 == null)
				p1 = emptyTabStopFormat;
			if (p2 == null)
				p2 = emptyTabStopFormat;
			if (p1 == p2)
				return true;

			if (!_positionProperty.equalHelper(p1.position, p2.position))
				return false;
			if (!_alignmentProperty.equalHelper(p1.alignment, p2.alignment))
				return false;
			if (!_decimalAlignmentTokenProperty.equalHelper(p1.decimalAlignmentToken, p2.decimalAlignmentToken))
				return false;

			return true;
		}

		/**
		 * Sets properties in this TabStopFormat object to <code>undefined</code> if they match those in the <code>incoming</code>
		 * ITabStopFormat instance.
		 * 
		 * @param incoming instance against which to compare this TabStopFormat object's property values.
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function removeMatching(incoming:ITabStopFormat):void
		{
			if (incoming == null)
				return;

			if (_positionProperty.equalHelper(this.position, incoming.position))
				this.position = undefined;
			if (_alignmentProperty.equalHelper(this.alignment, incoming.alignment))
				this.alignment = undefined;
			if (_decimalAlignmentTokenProperty.equalHelper(this.decimalAlignmentToken, incoming.decimalAlignmentToken))
				this.decimalAlignmentToken = undefined;
		}

		/**
		 * Sets properties in this TabStopFormat object to <code>undefined</code> if they do not match those in the
		 * <code>incoming</code> ITabStopFormat instance.
		 * 
		 * @param incoming instance against which to compare this TabStopFormat object's property values.
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		public function removeClashing(incoming:ITabStopFormat):void
		{
			if (incoming == null)
				return;

			if (!_positionProperty.equalHelper(this.position, incoming.position))
				this.position = undefined;
			if (!_alignmentProperty.equalHelper(this.alignment, incoming.alignment))
				this.alignment = undefined;
			if (!_decimalAlignmentTokenProperty.equalHelper(this.decimalAlignmentToken, incoming.decimalAlignmentToken))
				this.decimalAlignmentToken = undefined;
		}

		/**
		 * Gets the TabStopFormat hash
		 * @param seed seed value for the hash algorithm
		 * @return the TabStopFormat hash
		 * @private
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		tlf_internal function hash(seed:uint):uint
		{
			var hash:uint = seed;

			if (_position)
				hash = _positionProperty.hash(_position, hash);
			if (_alignment)
				hash = _alignmentProperty.hash(_alignment, hash);
			if (_decimalAlignmentToken)
				hash = _decimalAlignmentTokenProperty.hash(_decimalAlignmentToken, hash);

			return hash;
		}

		static private var _defaults:TabStopFormat;
		/**
		 * Returns a TabStopFormat object with default settings.
		 * This function always returns the same object.
		 * 
		 * @return a singleton instance of ITabStopFormat that is populated with default values.
		 * 
		 * @playerversion Flash 10
		 * @playerversion AIR 1.5
		 * @langversion 3.0
		 */
		static public function get defaultFormat():ITabStopFormat
		{
			if (_defaults == null)
			{
				_defaults = new TabStopFormat();
				Property.defaultsAllHelper(_description,_defaults);
				_defaultFormatHash = _defaults.hash(0);
			}
			return _defaults;
		}
		static private var _defaultFormatHash:uint;
		/** @private */
		static tlf_internal function getDefaultFormatHash():uint
		{
			defaultFormat;
			return _defaultFormatHash;
		}
	}
}