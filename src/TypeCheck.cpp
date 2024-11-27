#include "TypeCheck.h"

#define TYPE_SCALAR 0
#define TYPE_ARRAY 1
#define TYPE_FUNCTION 2

//global tabels
//typeMap func2retType; // function name to return type

// global token ids to type
typeMap g_token2Type; 

// local token ids to type, since func param can override global param
typeMap funcparam_token2Type;
vector<typeMap*> local_token2Type;

arrLengthMap array2Length;
typeMap* currentMap = &g_token2Type;
funcVector functionNames;
string currentFunc = "";
paramMemberMap func2Param;
paramMemberMap struct2Members;


void enter_scope(){
    typeMap * new_map;
    if (local_token2Type.size() == 0)
        new_map = new typeMap(g_token2Type);
    else
        new_map = new typeMap(*(local_token2Type.back()));
    
    local_token2Type.push_back(new_map);
    currentMap = new_map;
}

void leave_scope(){
    local_token2Type.pop_back();
    delete currentMap;
    currentMap = local_token2Type.back();
}
// private util functions
void error_print(std::ostream& out, A_pos p, string info)
{
    out << "Typecheck error in line " << p->line << ", col " << p->col << ": " << info << std::endl;
    exit(0);
}


bool check_struct_defined(std::ostream& out, aA_type type){
    if(!type){
        return false;
    }
    if(type->type == A_dataType::A_structTypeKind){
        if(struct2Members.find(*type->u.structType) == struct2Members.end()){
            error_print(out, type->pos, "Struct type not defined.");
            return false;
        }
    }
    return true;
}

tc_type get_type_in_map(typeMap* map, string tokenId){
    if(funcparam_token2Type.find(tokenId) != funcparam_token2Type.end())
        return funcparam_token2Type[tokenId];

    if(map->find(tokenId) == map->end())
        return nullptr;
    return (*map)[tokenId];
}

void print_token_map(typeMap* map){
    for(auto it = map->begin(); it != map->end(); it++){
        std::cout << it->first << " : ";
        switch (it->second->type->type)
        {
        case A_dataType::A_nativeTypeKind:
            switch (it->second->type->u.nativeType)
            {
            case A_nativeType::A_intTypeKind:
                std::cout << "int";
                break;
            default:
                break;
            }
            break;
        case A_dataType::A_structTypeKind:
            std::cout << *(it->second->type->u.structType);
            break;
        default:
            break;
        }
        switch(it->second->isVarArrFunc){
            case 0:
                std::cout << " scalar";
                break;
            case 1:
                std::cout << " array";
                break;
            case 2:
                std::cout << " function";
                break;
        }
        std::cout << std::endl;
    }
}


void print_token_maps(){
    std::cout << "global token2Type:" << std::endl;
    print_token_map(&g_token2Type);
    std::cout << "local token2Type:" << std::endl;
    print_token_map(&funcparam_token2Type);
}


bool comp_aA_type(aA_type target, aA_type t){
    if(!target || !t)
        return false;
    if(target->type != t->type)
        return false;
    if(target->type == A_dataType::A_nativeTypeKind)
        if(target->u.nativeType != t->u.nativeType)
            return false;
    if(target->type == A_dataType::A_structTypeKind)
        if(target->u.structType != t->u.structType)
            return false;
    return true;
}


bool comp_tc_type(tc_type target, tc_type t){
    if(!target || !t)
        return false;
    
    // arr kind first
    if (target->isVarArrFunc && t->isVarArrFunc == 0)
        return false;
    
    // if target type is nullptr, alwayse ok
    return comp_aA_type(target->type, t->type);
}


tc_type tc_Type(aA_type t, uint isVarArrFunc){
    tc_type ret = new tc_type_;
    ret->type = t;
    ret->isVarArrFunc = isVarArrFunc;
    return ret;
}


tc_type tc_Type(aA_varDecl vd){
    if(vd->kind == A_varDeclType::A_varDeclScalarKind)
        return tc_Type(vd->u.declScalar->type, 0);
    else if(vd->kind == A_varDeclType::A_varDeclArrayKind)
        return tc_Type(vd->u.declArray->type, 1);
    return nullptr;
}

tc_type check_RightVal(std::ostream& out, aA_rightVal rightVal){
    if(rightVal->kind == A_rightValType::A_arithExprValKind){
        return check_ArithExpr(out, rightVal->u.arithExpr);
    }else{
        check_BoolExpr(out, rightVal->u.boolExpr);
        aA_type aAType = new aA_type_;
        aAType->pos = rightVal->pos;
        aAType->type = A_dataType::A_nativeTypeKind;
        aAType->u.nativeType = A_nativeType::A_intTypeKind;
        tc_type type = tc_Type(aAType, TYPE_SCALAR); 
        return type;
    }

}

// public functions
void check_Prog(std::ostream& out, aA_program p)
{
    for (auto ele : p->programElements)
    {
        if(ele->kind == A_programVarDeclStmtKind){
            check_VarDecl(out, ele->u.varDeclStmt);
        }else if (ele->kind == A_programStructDefKind){
            check_StructDef(out, ele->u.structDef);
        }
    }
    
    for (auto ele : p->programElements){
        if(ele->kind == A_programFnDeclStmtKind){
            check_FnDeclStmt(out, ele->u.fnDeclStmt);
        }
        else if (ele->kind == A_programFnDefKind){
            check_FnDecl(out, ele->u.fnDef->fnDecl);
        }
    }

    for (auto ele : p->programElements){
        if(ele->kind == A_programFnDefKind){
            check_FnDef(out, ele->u.fnDef);
        }
        else if (ele->kind == A_programNullStmtKind){
            // do nothing
        }
    }

    out << "Typecheck passed!" << std::endl;
    return;
}


void check_VarDecl(std::ostream& out, aA_varDeclStmt vd)
{
    if (!vd)
        return;
    string name;
    if (vd->kind == A_varDeclStmtType::A_varDeclKind){
        // decl only
        aA_varDecl vdecl = vd->u.varDecl;
        if(vdecl->kind == A_varDeclType::A_varDeclScalarKind){
            name = *vdecl->u.declScalar->id;
            /* fill code here*/
            if(get_type_in_map(currentMap, name) != nullptr){
                error_print(out, vdecl->pos,"id \"" + name +"\" has been defined.");
            }
            check_struct_defined(out, vdecl->u.declScalar->type);
            tc_type temp = tc_Type(vdecl); 
            currentMap->insert({name, temp});
        }else if (vdecl->kind == A_varDeclType::A_varDeclArrayKind){
            name = *vdecl->u.declArray->id;
            /* fill code here*/
            if(get_type_in_map(currentMap, name) != nullptr){
                error_print(out, vdecl->pos,"id \"" + name +"\" has been defined.");
            }
            check_struct_defined(out, vdecl->u.declArray->type);
            tc_type temp = tc_Type(vdecl); 
            array2Length[name] = vdecl->u.declArray->len;
            currentMap->insert({name, temp});
            }
    }
    else if (vd->kind == A_varDeclStmtType::A_varDefKind){
      // decl and def
        aA_varDef vdef = vd->u.varDef;
        if (vdef->kind == A_varDefType::A_varDefScalarKind){
            name = *vdef->u.defScalar->id;
            aA_varDefScalar varDefScalar = vdef->u.defScalar;
            if(get_type_in_map(currentMap, name) != nullptr){
                error_print(out, vdef->pos, "id \"" + name +"\" has been defined.");
            }
            check_struct_defined(out, varDefScalar->type);
            tc_type t = check_RightVal(out, varDefScalar->val);
            if(varDefScalar->type == nullptr){
                tc_type deduced_type = check_RightVal(out, varDefScalar->val);
                currentMap->insert({name, deduced_type});
            }
            else{
                if(!comp_tc_type(t, tc_Type(varDefScalar->type, 0)))
                    error_print(out, vd->pos, "Assignment type doesn't match variable type.");
                currentMap->insert({name, tc_Type(varDefScalar->type, 0)});
            } 
        }else if (vdef->kind == A_varDefType::A_varDefArrayKind){
            name = *vdef->u.defArray->id;
            /* fill code here, allow omited type */
            aA_varDefArray vdefArray = vdef->u.defArray;
            if(get_type_in_map(currentMap, name) != nullptr){
                error_print(out, vdef->pos,"id \"" + name +"\" has been defined.");
            }
            check_struct_defined(out, vdef->u.defArray->type);
            if(vdefArray->len != vdefArray->vals.size()){
                error_print(out, vd->pos, "Array Length doesn't match.");
            }
            array2Length[name] = vdefArray->len;
            if(vdefArray->type == nullptr){
                tc_type type = check_RightVal(out, vdefArray->vals[0]);
                for(aA_rightVal rv: vdefArray->vals){
                    if(!comp_tc_type(check_RightVal(out, rv), type))
                        error_print(out, vd->pos, "Assignment type doesn't match variable type.");
                }
                currentMap->insert({name, tc_Type(vdefArray->type, TYPE_ARRAY)});
            }else{
                for(aA_rightVal rv: vdefArray->vals){
                    if(!comp_tc_type(check_RightVal(out, rv), tc_Type(vdefArray->type, TYPE_SCALAR))){
                        error_print(out,vd->pos ,"Assignment type doesn't match variable type.");
                    }
                }
                currentMap->insert({name, tc_Type(vdefArray->type, TYPE_ARRAY)});
            }
        }
    }
    return;
}


void check_StructDef(std::ostream& out, aA_structDef sd)
{
    if (!sd)
        return;
    string name = *sd->id;
    if (struct2Members.find(name) != struct2Members.end())
        error_print(out, sd->pos, "id \"" + name +"\" has been defined.");
    struct2Members[name] = &(sd->varDecls);
    return;
}


void check_FnDecl(std::ostream& out, aA_fnDecl fd)
{
    if (!fd)
        return;
    string name = *fd->id;

    // if already declared, should match
    if (func2Param.find(name) != func2Param.end()){
        // is function ret val matches
        /* fill code here */
        if(!comp_aA_type(get_type_in_map(&g_token2Type, name)->type, fd->type)){
            error_print(out, fd->pos, "Return type doesn't match.");
        }
        // is function params matches decl
        /* fill code here */
        // 形参数量不一致
        if(func2Param[name]->size() != fd->paramDecl->varDecls.size())
            error_print(out, fd->pos, "The number of function parameters doesn't match declaration.");
        
        for(int i = 0;i<func2Param[name]->size(); i++){
            A_varDeclType fnParmType = func2Param[name]->at(i)->kind;
            // kind 不对应
            if(fnParmType != fd->paramDecl->varDecls[i]->kind)
                error_print(out, fd->pos, "The kind of function parameters doesn't match declaration.");
            // u 不对应
            if(fnParmType == A_varDeclType::A_varDeclScalarKind){
                if(!comp_aA_type(func2Param[name]->at(i)->u.declScalar->type, fd->paramDecl->varDecls[i]->u.declScalar->type))
                    error_print(out, fd->pos, "The type of function parameters doesn't match declaration.");
            }
            else { 
                if(!comp_aA_type(func2Param[name]->at(i)->u.declArray->type, fd->paramDecl->varDecls[i]->u.declArray->type))
                    error_print(out, fd->pos, "The type of function parameters doesn't match declaration.");
            }
        }
    }else{
        // if not defined
        /* fill code here */
        g_token2Type[name] = tc_Type(fd->type, TYPE_FUNCTION);
        func2Param[name] = &(fd->paramDecl->varDecls);
    }
    return;
}


void check_FnDeclStmt(std::ostream& out, aA_fnDeclStmt fd)
{
    if (!fd)
        return;
    check_FnDecl(out, fd->fnDecl);
    return;
}


void check_FnDef(std::ostream& out, aA_fnDef fd)
{
    if (!fd)
        return;
    for(string name:functionNames){
        if(name == *fd->fnDecl->id)
            error_print(out, fd->pos, "The function already defined. ");
    }
    // should match if declared
    check_FnDecl(out, fd->fnDecl);
    // add params to local tokenmap, func params override global ones
    for (aA_varDecl vd : fd->fnDecl->paramDecl->varDecls)
    {
        /* fill code here */
        if(vd->kind == A_varDeclType::A_varDeclScalarKind){
            if(get_type_in_map(&g_token2Type, *vd->u.declScalar->id) != nullptr){
                error_print(out, vd->pos, "The param has been defined as global one.");
            }
            funcparam_token2Type[*vd->u.declScalar->id] = tc_Type(vd);
        }else{
            if(get_type_in_map(&g_token2Type, *vd->u.declArray->id) != nullptr){
                error_print(out, vd->pos, "The param has been defined as global one.");
            }
            funcparam_token2Type[*vd->u.declArray->id] = tc_Type(vd);
        }
    }

    /* fill code here */
    enter_scope();
    currentFunc = *fd->fnDecl->id;
    for (aA_codeBlockStmt stmt : fd->stmts)
    {
        check_CodeblockStmt(out, stmt);
        // return value type should match
        /* fill code here */        
    }
    leave_scope();
    currentFunc = "";
    for (aA_varDecl vd : fd->fnDecl->paramDecl->varDecls){
        if(vd->kind == A_varDeclType::A_varDeclScalarKind){
            funcparam_token2Type.erase(*vd->u.declScalar->id);
        }else{
            funcparam_token2Type.erase(*vd->u.declArray->id);
        }
    }

    functionNames.push_back(*fd->fnDecl->id);
    return;
}


void check_CodeblockStmt(std::ostream& out, aA_codeBlockStmt cs){
    if(!cs)
        return;
    // variables declared in a code block should not duplicate with outer ones.
    switch (cs->kind)
    {
    case A_codeBlockStmtType::A_varDeclStmtKind:
        check_VarDecl(out, cs->u.varDeclStmt);
        break;
    case A_codeBlockStmtType::A_assignStmtKind:
        check_AssignStmt(out, cs->u.assignStmt);
        break;
    case A_codeBlockStmtType::A_ifStmtKind:
        check_IfStmt(out, cs->u.ifStmt);
        break;
    case A_codeBlockStmtType::A_whileStmtKind:
        check_WhileStmt(out, cs->u.whileStmt);
        break;
    case A_codeBlockStmtType::A_callStmtKind:
        check_CallStmt(out, cs->u.callStmt);
        break;
    case A_codeBlockStmtType::A_returnStmtKind:
        check_ReturnStmt(out, cs->u.returnStmt);
        break;
    default:
        break;
    }
    return;
}


void check_AssignStmt(std::ostream& out, aA_assignStmt as){
    if(!as)
        return;
    string name;
    tc_type deduced_type; // deduced type if type is omitted at decl
    deduced_type = check_RightVal(out, as->rightVal);
    switch (as->leftVal->kind)
    {
        case A_leftValType::A_varValKind:{
            name = *as->leftVal->u.id;
            /* fill code here */
            tc_type tempType = get_type_in_map(currentMap, name);
            if(tempType == nullptr){
                error_print(out, as->pos, "Variable \"" + name +"\" hasn't been defined yet.");
            }
            if(tempType->type == nullptr){
                currentMap->find(name)->second = deduced_type;
            }else{
                if(!comp_tc_type(tempType, deduced_type))
                    error_print(out, as->pos, "Assignment type does not match variable type.");
            }
        }
            break;
        case A_leftValType::A_arrValKind:{
            /* fill code here */
            name = *as->leftVal->u.arrExpr->arr->u.id;
            tc_type tempType = get_type_in_map(currentMap, name);
            if(tempType == nullptr){
                error_print(out, as->pos, "Array \""+ name +"\" hasn't been defined.");
            }
            if(!comp_tc_type(tempType, deduced_type)){
                error_print(out, as->pos, "Assignment type doesn't match array type.");
            }
        }
            break;
        case A_leftValType::A_memberValKind:{
            /* fill code here */
            aA_memberExpr memberExpr = as->leftVal->u.memberExpr;
            if(memberExpr->structId->kind != A_leftValType::A_varValKind)
                error_print(out, as->pos, "Multi-level is not surpported.");
            string structID = *memberExpr->structId->u.id;
            string memberID = *memberExpr->memberId;
            tc_type t = get_type_in_map(currentMap, structID);
            if(t == nullptr)
                error_print(out, as->pos, "Struct \""+ structID +"\" hasn't been defined.");
            if(t->type->type != A_dataType::A_structTypeKind)
                error_print(out, as->pos, "Not a struct type.");
            vector<aA_varDecl>* memberDecls = struct2Members.find(*(t->type->u.structType))->second;
            bool isExist = false;
            for(aA_varDecl vd: *memberDecls){
                string id;
                if(vd->kind == A_varDeclType::A_varDeclScalarKind)
                    id = *vd->u.declScalar->id;
                else
                    id = *vd->u.declArray->id;
                
                if(id == memberID){
                    if(!comp_tc_type(tc_Type(vd), deduced_type))
                        error_print(out, as->pos, "Assignment type doesn't match struct member type.");
                    isExist = true;
                    break;
                }
            }

            if(!isExist)
                error_print(out, as->pos, "Struct member not defined.");
        }
            break;
    }
    return;
}


void check_ArrayExpr(std::ostream& out, aA_arrayExpr ae){
    if(!ae)
        return;
    string name = *ae->arr->u.id;
    // check array name
    /* fill code here */
    if(get_type_in_map(currentMap, name) == nullptr){
        error_print(out, ae->pos, "Array \"" + name + "\" hasn't been defined yet.");
    }
    // check index
    A_indexExprKind indexKind = ae->idx->kind;
    if(indexKind == A_indexExprKind::A_numIndexKind){
        if(ae->idx->u.num < 0 || ae->idx->u.num > array2Length[name]){
            error_print(out, ae->pos, "Array \"" + name + "\":Index out of bound.");
        }
    }else{
        if(get_type_in_map(currentMap, *ae->idx->u.id) == nullptr){
            error_print(out, ae->pos, "Array \"" + name + "\":Unkown ID index.");
        }
    }
    /* fill code here */
    return;
}

 
tc_type check_MemberExpr(std::ostream& out, aA_memberExpr me){
    // check if the member exists and return the tyep of the member
    if(!me)
        return nullptr;
    string name = *me->structId->u.id;
    // check struct name
    /* fill code here */
    if(get_type_in_map(currentMap, name) == nullptr){
        error_print(out, me->pos, "Struct \"" + name +"\" hasn't been defined.");
    } 
    if(get_type_in_map(currentMap, name)->type->type != A_dataType::A_structTypeKind){
        error_print(out, me->pos, name + ": Not a struct type.");
    }
    string structType = *(get_type_in_map(currentMap, name))->type->u.structType;
    // check member name
    /* fill code here */
    vector<aA_varDecl>* memberDecls = struct2Members[structType];

    for(aA_varDecl vd: *memberDecls){
        string id;

        if(vd->kind == A_varDeclType::A_varDeclScalarKind)
            id = *vd->u.declScalar->id;
        else
            id = *vd->u.declArray->id;

        if(id == *me->memberId){
            if(vd->kind == A_varDeclType::A_varDeclScalarKind)
                return tc_Type(vd->u.declScalar->type, TYPE_SCALAR);
            else
                return tc_Type(vd->u.declArray->type, TYPE_ARRAY);
        }
    }
        
    return nullptr;
}


void check_IfStmt(std::ostream& out, aA_ifStmt is){
    if(!is)
        return;
    check_BoolUnit(out, is->boolUnit);
    /* fill code here, take care of variable scope */
    enter_scope();
    for(aA_codeBlockStmt s : is->ifStmts){
        check_CodeblockStmt(out, s);
    }
    leave_scope();
    enter_scope();
    /* fill code here */    
    for(aA_codeBlockStmt s : is->elseStmts){
        check_CodeblockStmt(out, s);
    }
    leave_scope();
    /* fill code here */
    return;
}


void check_BoolExpr(std::ostream& out, aA_boolExpr be){
    if(!be)
        return;
    switch (be->kind)
    {
    case A_boolExprType::A_boolBiOpExprKind:
        check_BoolExpr(out, be->u.boolBiOpExpr->left);
        check_BoolExpr(out, be->u.boolBiOpExpr->right);
        break;
    case A_boolExprType::A_boolUnitKind:
        check_BoolUnit(out, be->u.boolUnit);
        break;
    default:
        break;
    }
    return;
}


void check_BoolUnit(std::ostream& out, aA_boolUnit bu){
    if(!bu)
        return;
    switch (bu->kind)
    {
        case A_boolUnitType::A_comOpExprKind:{
            /* fill code here */
            aA_comExpr comExpr = bu->u.comExpr;
            tc_type leftType = check_ExprUnit(out, comExpr->left);
            tc_type rightType = check_ExprUnit(out, comExpr->right);
            if(!comp_tc_type(leftType, rightType))
                error_print(out, bu->pos, "Comparison type doesn't match.");
        }
            break;
        case A_boolUnitType::A_boolExprKind:
            check_BoolExpr(out, bu->u.boolExpr);
            break;
        case A_boolUnitType::A_boolUOpExprKind:
            check_BoolUnit(out, bu->u.boolUOpExpr->cond);
            break;
        default:
            break;
    }
    return;
}


tc_type check_ExprUnit(std::ostream& out, aA_exprUnit eu){
    // return the aA_type of expr eu
    if(!eu)
        return nullptr;
    tc_type ret;
    switch (eu->kind)
    {
        case A_exprUnitType::A_idExprKind:{
            /* fill code here */
            tc_type tempType = get_type_in_map(currentMap, *eu->u.id);
            if(tempType == nullptr){
                error_print(out, eu->pos, "Variable \"" + *eu->u.id+" \" hasn't been defined.");
            }
            aA_type idt = new aA_type_;
            idt->pos = eu->pos;
            idt->type = tempType->type->type;
            if(idt->type == A_dataType::A_nativeTypeKind)
                idt->u.nativeType = tempType->type->u.nativeType;
            else
                idt->u.structType = tempType->type->u.structType;
            
            ret = tc_Type(idt, tempType->isVarArrFunc);
        }
            break;
        case A_exprUnitType::A_numExprKind:{
            aA_type numt = new aA_type_;
            numt->pos = eu->pos;
            numt->type = A_dataType::A_nativeTypeKind;
            numt->u.nativeType = A_nativeType::A_intTypeKind;
            ret = tc_Type(numt, 0);
        }
            break;
        case A_exprUnitType::A_fnCallKind:{
            check_FuncCall(out, eu->u.callExpr);
            // check_FuncCall will check if the function is defined
            /* fill code here */
            string func_name = *eu->u.callExpr->fn;
            aA_type callType = new aA_type_;
            callType->pos = eu->pos;
            callType->type = g_token2Type[func_name]->type->type;
            
            if(callType->type == A_dataType::A_nativeTypeKind){
                callType->u.nativeType = g_token2Type[func_name]->type->u.nativeType;
            }else{
                callType->u.structType = g_token2Type[func_name]->type->u.structType;
            }
            ret = tc_Type(callType, TYPE_SCALAR);
        }
            break;
        case A_exprUnitType::A_arrayExprKind:{
            check_ArrayExpr(out, eu->u.arrayExpr);
            /* fill code here */
            aA_type arrExprType = new aA_type_;
            arrExprType->pos = eu->pos;
            
            if(eu->u.arrayExpr->arr->kind != A_leftValType::A_varValKind)
                error_print(out, eu->pos, "Only support One-level Array.");

            tc_type t = get_type_in_map(currentMap, *eu->u.arrayExpr->arr->u.id);

            arrExprType->type = t->type->type;
            if(arrExprType->type == A_dataType::A_nativeTypeKind)
                arrExprType->u.nativeType = t->type->u.nativeType;
            else
                arrExprType->u.structType = t->type->u.structType;

            ret = tc_Type(arrExprType, TYPE_ARRAY);
        }
            break;
        case A_exprUnitType::A_memberExprKind:{
            ret = check_MemberExpr(out, eu->u.memberExpr);
        }
            break;
        case A_exprUnitType::A_arithExprKind:{
            ret = check_ArithExpr(out, eu->u.arithExpr);
        }
            break;
        case A_exprUnitType::A_arithUExprKind:{
            ret = check_ExprUnit(out, eu->u.arithUExpr->expr);
        }
            break;
    }
    return ret;
}


tc_type check_ArithExpr(std::ostream& out, aA_arithExpr ae){
    if(!ae)
        return nullptr;
    tc_type ret;
    switch (ae->kind)
    {
        case A_arithExprType::A_arithBiOpExprKind:{
            ret = check_ArithExpr(out, ae->u.arithBiOpExpr->left);
            tc_type rightType = check_ArithExpr(out, ae->u.arithBiOpExpr->right);
            if(ret->type->type > 0 || ret->type->type != A_dataType::A_nativeTypeKind || ret->type->u.nativeType != A_nativeType::A_intTypeKind ||
            rightType->type->type > 0 || rightType->type->type != A_dataType::A_nativeTypeKind || rightType->type->u.nativeType != A_nativeType::A_intTypeKind)
                error_print(out, ae->pos, "Only int can be arithmetic expression operation values.");
        }
            break;
        case A_arithExprType::A_exprUnitKind:
            ret = check_ExprUnit(out, ae->u.exprUnit);
            break;
    }
    return ret;
}


void check_FuncCall(std::ostream& out, aA_fnCall fc){
    if(!fc)
        return;
    // check if function defined
    string func_name = *fc->fn;
    /* fill code here */
    if(func2Param.find(func_name) == func2Param.end()){
        error_print(out, fc->pos,"Called undefined function.");
    }
        
    // check if parameter list matches
    if(func2Param[func_name]->size() != fc->vals.size()){
        error_print(out, fc->pos, "Function parameter number does not match declaration.");
    }
    for(int i = 0; i < fc->vals.size(); i++){
        /* fill code here */
        if(!comp_tc_type(tc_Type(func2Param[func_name]->at(i)), check_RightVal(out, fc->vals[i])))
            error_print(out, fc->pos, "Function parameter kind doesn't match declaration.");
    }
    return ;
}


void check_WhileStmt(std::ostream& out, aA_whileStmt ws){
    if(!ws)
        return;
    check_BoolUnit(out, ws->boolUnit);
    /* fill code here, take care of variable scope */
    enter_scope();    
    for(aA_codeBlockStmt s : ws->whileStmts){
        check_CodeblockStmt(out, s);
    }
    /* fill code here */
    leave_scope();  
    return;
}


void check_CallStmt(std::ostream& out, aA_callStmt cs){
    if(!cs)
        return;
    check_FuncCall(out, cs->fnCall);
    return;
}


void check_ReturnStmt(std::ostream& out, aA_returnStmt rs){
    if(!rs)
        return;
     if(currentFunc.empty())
        error_print(out, rs->pos, "The returnStmt is in the wrong position. ");

    tc_type funcType = g_token2Type.find(currentFunc)->second;
    tc_type ret = check_RightVal(out, rs->retVal);

    if(ret->isVarArrFunc!=0 || !comp_aA_type(ret->type, funcType->type))
        error_print(std::cout, rs->pos, "Return type does not match function return type.");
    return;
}