reflect.Elem()——通过反射获取指针指向的元素类型
Go 程序中对指针获取反射对象时，可以通过 reflect.Elem() 方法获取这个指针指向的元素类型。这个获取过程被称为取元素，等效于对指针类型变量做了一个*操作


package main
import (
    "fmt"
    "reflect"
)
func main() {
    // 声明一个空结构体
    type cat struct {
    }
    // 创建cat的实例
    ins := &cat{}
    // 获取结构体实例的反射类型对象
    typeOfCat := reflect.TypeOf(ins)
    // 显示反射类型对象的名称和种类
    fmt.Printf("name:'%v' kind:'%v'\n",typeOfCat.Name(), typeOfCat.Kind())
    // 取类型的元素
    typeOfCat = typeOfCat.Elem()
    // 显示反射类型对象的名称和种类
    fmt.Printf("element name: '%v', element kind: '%v'\n", typeOfCat.Name(), typeOfCat.Kind())
}
