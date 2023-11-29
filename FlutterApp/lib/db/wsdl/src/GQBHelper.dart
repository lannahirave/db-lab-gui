
//------------------------------------------------------------------------
//
// Generated by www.easywsdl.com
// Version: 8.0.1.0
//
// Created by Quasar Development 
//
// This class has been generated for test purposes only and cannot be used in any commercial project.
// To use it in commercial project, you need to generate this class again with Premium account.
// Check https://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account.
//
// Licence: CA3F4CEB7486F6668BD6F181D6CA68F608603F641897C20DF217C55FE3F3416F64E665190F35F5CE91CF8F38D5FB78FB96170CE35D755393898FFBDA2F093BF2
//------------------------------------------------------------------------
part of com.example.testSoap.wcf;

class GQBHelper
{
    static const String MS_SERIALIZATION_NS = "http://schemas.microsoft.com/2003/10/Serialization/";
    static const String XSI = "http://www.w3.org/2001/XMLSchema-instance";
    
    static XmlNode getResult(XmlElement body,String name,bool isAttribute)
    {
        var resultElement=body.firstElementChild;
        if(resultElement?.firstElementChild!=null)
        {
            var propertyElement=resultElement!.firstElementChild!;
            if(isAttribute)
            {
                var attrNode= propertyElement.getAttributeNode(name);
                if(attrNode!=null)
                {
                    return attrNode;
                }
            }
            else
            {
                if(propertyElement.name.local==name)
                {
                    return propertyElement;
                }
            }
        }

        if(isAttribute)
        {
            var attrNode= resultElement?.getAttributeNode(name);
            if(attrNode!=null)
            {
                return attrNode;
            }
        }
        else if(resultElement?.name.local==name)
        {
            return resultElement!;
        }
                
        return body;
    }

    static bool toBoolFromString(String str)
    {
        switch(str)
        {
            case "True":
            case "true":
            case "yes":
            case "1":
                return true;
        }
        return false;
    }

    static bool isValue(XmlElement? node,String name)
    {
        if(node==null)
        {
            return false;
        }
        if(node.name.local==name)
        {
            var nilAttr=node.getAttribute("nil",namespace:XSI);
            return nilAttr==null;
        }
        return true;
    }

    static XmlElement? getNode(XmlElement node,String name,String uri,[int index=0])
    {
        var children=node.findElements(name,namespace:uri);
        if(children.length>0)
        {
            return children.elementAt(index);
        }
        return null;
    }

    static bool hasValue(XmlElement? node, String name)
    {
        if(node==null)
        {
            return false;
        }
        var child=getNodeByLocalName( node,  name);
        if (child != null)
        {
            var nilAttr=child.getAttribute("nil", namespace:XSI);
            return nilAttr==null;
        }
        return false;
    }

    static XmlElement? getNodeByLocalName(XmlElement node,String name,[int index=0])
    {
        var children=node.findElements(name,namespace:"*");
        if(children.length>0)
        {
            return children.elementAt(index);
        }
        return null;
    }
    
    static bool hasAttribute(XmlElement node,String name,[String? namespace]){
        return getAttribute(node,name, namespace)!=null;
    }

    static XmlAttribute? getAttribute(XmlElement node,String name,[String? namespace]){
        if(namespace?.isEmpty==true)
        {
            namespace=null;
        }
        return node.getAttributeNode(name,namespace: namespace);
    }

    static String _fourDigits(int n) {
        int absN = n.abs();
        String sign = n < 0 ? "-" : "";
        if (absN >= 1000) return "$n";
        if (absN >= 100) return "${sign}0$absN";
        if (absN >= 10) return "${sign}00$absN";
        return "${sign}000$absN";
    }

    static String _sixDigits(int n) {
        assert(n < -9999 || n > 9999);
        int absN = n.abs();
        String sign = n < 0 ? "-" : "+";
        if (absN >= 100000) return "$sign$absN";
        return "${sign}0$absN";
    }

    static String _twoDigits(int n) {
        if (n >= 10) return "${n}";
        return "0${n}";
    }

    static String? getStringFromDate(DateTime? date){
        if(date!=null)
        {
            String y =(date.year >= -9999 && date.year <= 9999) ? _fourDigits(date.year) : _sixDigits(date.year);
            String m = _twoDigits(date.month);
            String d = _twoDigits(date.day);
            return "$y-$m-${d}";
        }
        return null;
    }

    static String? getStringFromDateTime(DateTime? date){
        if(date!=null)
        {
            return date.toIso8601String();
        }
        return null;
    }
}